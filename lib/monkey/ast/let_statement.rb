# typed: strict
# frozen_string_literal: true

module Monkey
  module AST
    class LetStatement
      extend T::Sig
      include Statement

      sig { returns(Identifier) }
      attr_reader :identifier

      sig { returns(T.nilable(Expression)) }
      attr_reader :expression

      sig do
        params(token: Token, identifier: Identifier,
               expression: T.nilable(Expression)).void
      end
      def initialize(token:, identifier:, expression:)
        super(token: token)
        @identifier = identifier
        @expression = expression
      end

      sig { returns(String) }
      def to_s
        "#{token_literal} #{@identifier} = #{@expression};"
      end
    end
  end
end
