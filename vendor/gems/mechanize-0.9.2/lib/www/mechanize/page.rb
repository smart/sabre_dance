require 'www/mechanize/page/link'
require 'www/mechanize/page/meta'
require 'www/mechanize/page/base'
require 'www/mechanize/page/frame'
require 'www/mechanize/headers'

module WWW
  class Mechanize
    # = Synopsis
    # This class encapsulates an HTML page.  If Mechanize finds a content
    # type of 'text/html', this class will be instantiated and returned.
    #
    # == Example
    #  require 'rubygems'
    #  require 'mechanize'
    #
    #  agent = WWW::Mechanize.new
    #  agent.get('http://google.com/').class  #=> WWW::Mechanize::Page
    #
    class Page < WWW::Mechanize::File
      extend Forwardable

      attr_accessor :mech
      attr_accessor :encoding

      def initialize(uri=nil, response=nil, body=nil, code=nil, mech=nil)
        @encoding = nil
        response.each do |header,v|
          next unless v =~ /charset/i
          @encoding = v.split('=').last.strip
        end
        @encoding ||= Util.detect_charset(body)
        body = Util.to_native_charset(body, @encoding) rescue body

        super(uri, response, body, code)
        @mech           ||= mech

        raise Mechanize::ContentTypeError.new(response['content-type']) unless
           response['content-type'] =~ /^(text\/html)|(application\/xhtml\+xml)/i
        @parser = @links = @forms = @meta = @bases = @frames = @iframes = nil
      end

      def title
        @title ||= if parser && search('title').inner_text.length > 0
          search('title').inner_text
        end
      end

      def parser
        return @parser if @parser

        if body && response
          html_body = body.length > 0 ? body : '<html></html>'
          if WWW::Mechanize.html_parser == Nokogiri::HTML
            @parser = Mechanize.html_parser.parse(html_body, nil, @encoding)
          else
            @parser = Mechanize.html_parser.parse(html_body)
          end
        end

        @parser
      end
      alias :root :parser

      # Get the content type
      def content_type
        response['content-type']
      end

      # Search through the page like HPricot
      def_delegator :parser, :search, :search
      def_delegator :parser, :/, :/
      def_delegator :parser, :at, :at

      # Find a form matching +criteria+.
      # Example:
      #   page.form_with(:action => '/post/login.php') do |f|
      #     ...
      #   end
      [:form, :link, :base, :frame, :iframe].each do |type|
        eval(<<-eomethod)
          def #{type}s_with(criteria)
            criteria = {:name => criteria} if String === criteria
            f = #{type}s.find_all do |thing|
              criteria.all? { |k,v| v === thing.send(k) }
            end
            yield f if block_given?
            f
          end

          def #{type}_with(criteria)
            f = #{type}s_with(criteria).first
            yield f if block_given?
            f
          end
          alias :#{type} :#{type}_with
        eomethod
      end
    
      def links
        @links ||= %w{ a area }.map do |tag|
          search(tag).map do |node|
            Link.new(node, @mech, self)
          end
        end.flatten
      end

      def forms
        @forms ||= search('form').map do |html_form|
          form = Form.new(html_form, @mech, self)
          form.action ||= @uri.to_s
          form
        end
      end

      def meta
        @meta ||= search('meta').map do |node|
          next unless node['http-equiv'] && node['content']
          (equiv, content) = node['http-equiv'], node['content']
          if equiv && equiv.downcase == 'refresh'
            if content && content =~ /^\d+\s*;\s*url\s*=\s*'?([^\s']+)/i
              node['href'] = $1
              Meta.new(node, @mech, self)
            end
          end
        end.compact
      end

      def bases
        @bases ||=
          search('base').map { |node| Base.new(node, @mech, self) }
      end

      def frames
        @frames ||=
          search('frame').map { |node| Frame.new(node, @mech, self) }
      end

      def iframes
        @iframes ||= 
          search('iframe').map { |node| Frame.new(node, @mech, self) }
      end
    end
  end
end
