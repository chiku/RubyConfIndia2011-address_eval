class Address
  def initialize(name)
    @name = name
  end

  def state
    State::TRUEY
  end

  class << self
    def bangalore
      Address.new :name => "bangalore"
    end

    def delhi
      Address.new :name => "delhi"
    end
  end

  class State
    def initialize(address)
      @address = address
    end

    TRUEY  = State.new Address.bangalore
    FALSEY = State.new Address.delhi

   def self_and_ancestors
     [ self ]
   end
  end

  Address.module_eval do
    State.constants.each do |state_var|
      define_method "#{state_var.downcase}?" do
        state.self_and_ancestors.any? { |state| state == eval("State::#{state_var}") }
      end
    end
  end
end
