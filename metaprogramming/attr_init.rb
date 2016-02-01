class Object
  def self.attr_init(*args)
    code = %Q{
      def initialize(#{ args.join(', ') })
    }
    
    args.each do |arg_item|
      code += %Q{
        @#{ arg_item } = #{ arg_item }}
    end
    
    code += %Q{
      end
      attr_accessor :#{ args.join(', :') }
    }
    class_eval(code)
  end
end
