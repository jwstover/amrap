defmodule AmrapWeb.HomeLive.Index do
  @moduledoc false

  use AmrapWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="max-w-7xl mx-auto">
      <section class=" border-white/10 pt-20">
        <h1 class="max-w-3xl mx-auto text-5xl sm:text-7xl font-bold tracking-tight text-center text-balance">
          Easier <span class="bg-gradient-to-r from-red-500 to-orange-500 bg-clip-text text-transparent ">
         Functional Fitness Programming
        </span>With AI
        </h1>
      </section>

      <section class=" border-white/10 py-8 md:py-20">
        <div class="text-center text-balance">
          <p class="text-xl">
            <span class="font-[oswald]">AMRAP</span>
            is an AI-powered tool designed to assist in programming functional fitness style workouts. <br />
            Whether you are a box owner programming for your gym, or an athlete looking for an interesting WOD,
            <span class="font-[oswald]">AMRAP</span>
            is for you.
          </p>
        </div>
      </section>

      <section>
        <div class="flex justify-center">
          <.button
            class="bg-red-600 border-red-700 hover:bg-red-700 active:bg-red-800 transition-all"
            phx-click={JS.focus(to: "#notify-input")}
          >
            Notify Me <.icon name="hero-arrow-right-mini" />
          </.button>
        </div>
      </section>

      <section class="py-20 max-w-7xl mx-auto">
        <div class="mx-auto flex gap-2 items-center justify-center mb-20">
          <div class="h-px flex-grow bg-gradient-to-l from-zinc-400 to-transparent"></div>
          <h2 class="font-bold text-xl uppercase">Features</h2>
          <div class="h-px flex-grow bg-gradient-to-r from-zinc-400 to-transparent"></div>
        </div>
        <div class="grid md:grid-cols-3 gap-6">
          <div class="flex flex-col gap-6 order-2 sm:order-1">
            <.card title="Save Time Programming" class="pattern-boxes">
              Our goal with AMRAP isn't to replace your current programming, but to accent it.  Use AMRAP to generate a single WOD or an entire training block and iterate from there!
            </.card>

            <.card title="Automatically write warm-ups" class="pattern-dots">
              You've done the hard work and created a great WOD, now let AMRAP generate a warm-up specific to it.
            </.card>
          </div>

          <div class="flex flex-col gap-6 order-1 sm:order-2">
            <.card title="Customize your WOD" class="pattern-dots">
              AMRAP gives to tons of ways to customize your workout. You can specify everythying from your desired intensity and skill level, to the movements or equipment that you would like to include.
            </.card>

            <.card title="Apply Best Practices" class="pattern-dots">
              AMRAP is trained to follow programming best practices.
            </.card>

            <.card title="Automatically write warm-ups" class="pattern-boxes">
              You've done the hard work and created a great WOD, now let AMRAP generate a warm-up specific to it.
            </.card>
          </div>

          <div class="flex flex-col gap-6 order-3">
            <.card title="Scale Appropriately" class="pattern-dots">
              Have an injury you need to work around? AMRAP can take a WOD and scale it do so!
            </.card>

            <.card title="Identify Potential Issues" class="pattern-boxes">
              AMRAP can help to identify potential weaknesses in a programming plan. Maybe squats are over-programmed or perhaps a WOD is a bit to difficult for your desired skill level. AMRAP can point out those issues.
            </.card>
          </div>
        </div>
      </section>

      <section class="">
        <div class="mx-auto flex gap-2 items-center justify-center">
          <div class="h-px flex-grow bg-gradient-to-l from-zinc-400 to-transparent"></div>
          <h2 class="font-bold text-xl uppercase">Coming Soon!</h2>
          <div class="h-px flex-grow bg-gradient-to-r from-zinc-400 to-transparent"></div>
        </div>
        <p class="text-center text-balance py-8">
          AMRAP is still in early development. If you'd like to be kept up to date on it's progress sign up below!
        </p>
        <div class="flex justify-center w-full px-6">
          <div class="flex flex-wrap justify-center sm:justify-start items-end gap-2">
            <div class="w-full sm:w-96">
              <.input id="notify-input" name="email" value="" label="Notify Me" placeholder="Email" />
            </div>
            <.button class="md:text-lg px-6 md:font-bold py-2 bg-red-600 border-red-700 hover:bg-red-700 active:bg-red-800 transition-all">
              Notify Me
            </.button>
          </div>
        </div>
      </section>
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :title, :string, required: true
  slot :inner_block

  def card(assigns) do
    ~H"""
    <div class={["border border-white/20 rounded-lg shadow-lg shadow-black px-8 py-14", @class]}>
      <h3 class="text-xl font-semibold mb-2">{@title}</h3>
      <p class="text-zinc-200 text">
        {render_slot(@inner_block)}
      </p>
    </div>
    """
  end
end
