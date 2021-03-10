defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "When all params are valid, return an user" do
      params = %{
        name: "Robson",
        password: "123456",
        nickname: "Maestro2021",
        email: "robson2021@banana.com",
        age: 53
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Robson", age: 53, id: ^user_id} = user
    end

    test "When there are invalid params, return an error" do
      params = %{
        name: "Robson",
        nickname: "Maestro2021",
        email: "robson2021@banana.com",
        age: 53
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{password: ["can't be blank"]}

      assert errors_on(changeset) == expected_response
    end
  end
end
