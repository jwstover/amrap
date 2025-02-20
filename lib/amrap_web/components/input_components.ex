defmodule AmrapWeb.InputComponents do
  @moduledoc false

  use AmrapWeb, :html

  attr :id, :string, required: true
  attr :name, :string, required: true
  attr :options, :any, required: true
  attr :value, :string, default: nil

  def radio_group(assigns) do
    ~H"""
    <div class="flex flex-wrap gap-2">
      <label
        :for={option <- @options}
        id={"#{@id}_#{String.downcase(option)}"}
        class={["btn rounded-full has-checked:btn-primary"]}
      >
        <input
          id={"#{@id}_#{String.downcase(option)}_input"}
          hidden
          type="radio"
          name={@name}
          value={option}
          checked={option == @value}
        />
        {option}
      </label>
    </div>
    """
  end
end
