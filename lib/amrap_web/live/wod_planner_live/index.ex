defmodule AmrapWeb.WodPlannerLive.Index do
  @moduledoc false
  alias Amrap.Exercises

  use AmrapWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket |> assign_exercise_groups() |> assign(:exercises, Exercises.exercises())}
  end

  def handle_event("generate", params, socket) do
    IO.inspect(params, label: "================== PARAM\n")
    {:noreply, socket}
  end

  defp assign_exercise_groups(socket) do
    groups = Exercises.exercises_by_group()
    assign(socket, exercise_groups: groups)
  end

  def render(assigns) do
    ~H"""
    <div>
      <section class="max-w-5xl mx-auto">
        <.header>Wod Planner</.header>

        <.simple_form for={%{}} phx-submit="generate">
          <.form_section title="WOD Style">
            <.live_component
              id="style-radio"
              module={AmrapWeb.RadioButtonGroup}
              name="style"
              options={["AMRAP", "EMOM", "Chipper"]}
            />
          </.form_section>

          <.form_section title="Time Domain">
            <div class="flex items-end gap-2">
              <.input
                class="input-bordered w-32"
                name="time_domain"
                value="20"
                placeholder="20"
                type="number"
              />
              <span>minutes</span>
            </div>
          </.form_section>

          <.form_section title="Level">
            <.live_component
              id="level-radio"
              module={AmrapWeb.RadioButtonGroup}
              name="level"
              options={["Beginner", "Intermmediate", "Advanced"]}
            />
          </.form_section>

          <.form_section title="Exercises">
            <div class="flex flex-wrap gap-2">
              <.exercises exercises={@exercises} />
            </div>
          </.form_section>

          <.button class="btn-primary">Generate</.button>
        </.simple_form>
      </section>
    </div>
    """
  end

  attr :title, :string, required: true

  slot :inner_block

  def form_section(assigns) do
    ~H"""
    <section>
      <.h2 class="mb-4">{@title}</.h2>

      <div class="ml-4">
        {render_slot(@inner_block)}
      </div>
    </section>
    """
  end

  attr :exercises, :any, required: true

  def exercises(assigns) do
    ~H"""
    <label
      :for={exercise <- @exercises}
      class="btn has-[:checked]:btn-primary"
      phx-click={JS.toggle_attribute({"checked", "true"}, to: "##{exercise_id(exercise.name)}")}
    >
      <input id={exercise_id(exercise.name)} class="btn checked:btn-primary" type="checkbox" name="exercises[]" value={exercise.name} />
      {exercise.name}
    </label>
    """
  end

  def grouped_exercises(assigns) do
    ~H"""
    <section class="space-y-2">
      <.h2>Exercises</.h2>
      <.collapse
        :for={{group, exercises} <- @exercise_groups}
        title={group}
        class="collapse-arrow border border-base-content/20"
      >
        <label
          :for={exercise <- exercises}
          class="btn"
          phx-click={JS.toggle_attribute({"checked", ""}, to: "##{exercise_id(exercise.name)}")}
        >
          <input
            id={exercise_id(exercise.name)}
            type="checkbox"
            name="exercises[]"
            value={exercise.name}
          />
          {exercise.name}
        </label>
      </.collapse>
    </section>
    """
  end

  defp exercise_id(name) do
    name
    |> String.downcase()
    |> String.replace(~r/\s/, "_")
  end
end
