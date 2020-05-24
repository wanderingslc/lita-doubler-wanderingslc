module Lita
  module Handlers
    class Doubler < Handler
      # insert handler code here
      route(
        /^double\s+(\d+)$/i,
        :respond_with_double,
        command: true,
        help: {'double N' => 'prints N + N'}
      )

      def double_number n 
        n + n 
      end

      def respond_with_double response 
        n = response.match_data.captures first 
        n = Integer(n)

        response.reply "#{n} + #{n} = #{double_number n}"
      end

      Lita.register_handler(self)
    end
  end
end
