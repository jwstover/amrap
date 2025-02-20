defmodule AmrapWeb.RadioButtonGroup do
  @moduledoc false

  use AmrapWeb, :live_component

  def update(assigns, socket) do
    {:ok, assign(socket, assigns) |> assign(:selected, nil)}
  end

  def handle_event("select", %{"option" => option}, socket) do
    selected = if socket.assigns.selected == option, do: nil, else: option
    {:noreply, assign(socket, :selected, selected)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-wrap gap-2">
      <label
        :for={option <- @options}
        id={"#{@id}_#{String.downcase(option)}"}
        class={["btn rounded-full", option == @selected && "btn-primary"]}
        phx-click={JS.push("select", value: %{option: option}, target: @myself)}
      >
        <input
          id={"#{@id}_#{String.downcase(option)}_input"}
          hidden
          type="radio"
          name={@name}
          value={option}
          checked={option == @selected}
        />
        {option}
      </label>
    </div>
    """
  end
end
