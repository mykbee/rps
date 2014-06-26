module RPS
  module Databases
    class ORM
      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'rps')
        build_tables
      end
      def build_tables
      end
    end
  end
end
