defmodule Amrap.Exercises do
  @moduledoc """

  """

  @exercises [
    %{
      name: "Air Squat",
      category: "Bodyweight",
      description: "A squat performed without additional weight, focusing on depth and form."
    },
    %{
      name: "Back Squat",
      category: "Weightlifting",
      description: "A squat with a barbell placed on the upper back."
    },
    %{
      name: "Front Squat",
      category: "Weightlifting",
      description: "A squat with a barbell resting on the front rack position."
    },
    %{
      name: "Overhead Squat",
      category: "Weightlifting",
      description: "A squat with a barbell held overhead, testing mobility and stability."
    },
    %{
      name: "Goblet Squat",
      category: "Weightlifting",
      description: "A squat performed while holding a kettlebell or dumbbell at chest height."
    },
    %{
      name: "Box Squat",
      category: "Weightlifting",
      description: "A squat performed to a box to enforce depth and control."
    },
    %{
      name: "Deadlift",
      category: "Weightlifting",
      description: "Lifting a barbell from the ground to a standing position."
    },
    %{
      name: "Sumo Deadlift",
      category: "Weightlifting",
      description: "A deadlift with a wide stance and hands inside the legs."
    },
    %{
      name: "Sumo Deadlift High Pull",
      category: "Weightlifting",
      description: "A sumo deadlift followed by pulling the barbell to collarbone height."
    },
    %{
      name: "Romanian Deadlift",
      category: "Weightlifting",
      description:
        "A deadlift variation focusing on the hamstrings by keeping the legs slightly bent."
    },
    %{
      name: "Clean",
      category: "Weightlifting",
      description: "Lifting a barbell from the ground to the front rack position."
    },
    %{
      name: "Power Clean",
      category: "Weightlifting",
      description: "A clean where the barbell is caught above a full squat position."
    },
    %{
      name: "Squat Clean",
      category: "Weightlifting",
      description: "A clean where the barbell is caught in a full squat."
    },
    %{
      name: "Hang Clean",
      category: "Weightlifting",
      description: "A clean variation where the lift starts from a hanging position."
    },
    %{
      name: "Snatch",
      category: "Weightlifting",
      description: "Lifting a barbell from the ground to overhead in one motion."
    },
    %{
      name: "Power Snatch",
      category: "Weightlifting",
      description: "A snatch where the barbell is caught above a full squat."
    },
    %{
      name: "Squat Snatch",
      category: "Weightlifting",
      description: "A snatch where the barbell is caught in a full squat."
    },
    %{
      name: "Hang Snatch",
      category: "Weightlifting",
      description: "A snatch performed from a hanging position."
    },
    %{
      name: "Thruster",
      category: "Weightlifting",
      description: "A front squat followed by an overhead press in one fluid movement."
    },
    %{
      name: "Push Press",
      category: "Weightlifting",
      description: "A press overhead using a slight dip and drive from the legs."
    },
    %{
      name: "Push Jerk",
      category: "Weightlifting",
      description: "A dip and drive overhead movement with a re-bend of the knees."
    },
    %{
      name: "Split Jerk",
      category: "Weightlifting",
      description: "A dip and drive overhead movement where the legs split for stability."
    },
    %{
      name: "Kettlebell Swing",
      category: "Conditioning",
      description: "A hip-driven movement swinging a kettlebell overhead or to chest height."
    },
    %{
      name: "Russian Kettlebell Swing",
      category: "Conditioning",
      description: "A kettlebell swing where the kettlebell reaches chest height."
    },
    %{
      name: "Box Jump",
      category: "Plyometrics",
      description: "Jumping onto a box and standing tall before stepping down."
    },
    %{
      name: "Burpee",
      category: "Bodyweight",
      description: "A full-body movement that involves a push-up followed by a jump."
    },
    %{
      name: "Pull-Up",
      category: "Gymnastics",
      description: "Pulling the chin over a bar using upper body strength."
    },
    %{
      name: "Chest-to-Bar Pull-Up",
      category: "Gymnastics",
      description: "A pull-up where the chest makes contact with the bar."
    },
    %{
      name: "Kipping Pull-Up",
      category: "Gymnastics",
      description: "A pull-up performed with a swinging motion to generate momentum."
    },
    %{
      name: "Strict Pull-Up",
      category: "Gymnastics",
      description: "A pull-up performed without any kipping or swinging."
    },
    %{
      name: "Muscle-Up",
      category: "Gymnastics",
      description: "A pull-up transitioning into a dip on rings or a bar."
    },
    %{
      name: "Toes-to-Bar",
      category: "Gymnastics",
      description: "Hanging from a pull-up bar and bringing toes to touch the bar."
    },
    %{
      name: "Double-Under",
      category: "Conditioning",
      description: "Jumping rope where the rope passes under the feet twice per jump."
    },
    %{
      name: "Handstand Push-Up",
      category: "Gymnastics",
      description: "An inverted push-up performed while in a handstand."
    },
    %{
      name: "Rowing",
      category: "Conditioning",
      description: "Using a rowing machine to simulate rowing for distance or calories."
    },
    %{
      name: "Wall Ball Shot",
      category: "Conditioning",
      description: "Squatting with a medicine ball and throwing it at a target on the wall."
    },
    %{
      name: "Sled Push",
      category: "Strongman",
      description: "Pushing a weighted sled across a set distance."
    },
    %{
      name: "Farmer's Carry",
      category: "Strongman",
      description: "Walking a set distance while holding heavy weights."
    },
    %{
      name: "Yoke Carry",
      category: "Strongman",
      description: "Walking with a heavily loaded yoke across the back."
    },
    %{
      name: "Tire Flip",
      category: "Strongman",
      description: "Flipping a large tire using full-body strength."
    }
  ]

  def exercises do
    @exercises
  end

  def exercises_by_group do
    @exercises
    |> Enum.sort_by(& &1.name)
    |> Enum.group_by(& &1.category)
  end
end
