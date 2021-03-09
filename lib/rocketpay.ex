defmodule Rocketpay do
  alias Rocketpay.Accounts.{Deposit, WithDraw, Transaction}
  alias Rocketpay.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call

  defdelegate withdraw(params), to: WithDraw, as: :call

  defdelegate transaction(params), to: Transaction, as: :call
end
