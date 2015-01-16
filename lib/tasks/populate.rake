namespace :populate do
  desc "creates all the nodes for the flow map"
  task create_nodes: :environment do

    # create branches
    scenario_questions_branch = Branch.create(name: "scenario questions")
    meet_offsite_branch = Branch.create(name: "meet offsite with short train ride to terminals")
    wait_offsite_branch = Branch.create(name: "wait offsite until pickup ready")
    park_and_meet_branch = Branch.create(name: "park and meet passenger at terminal")
    hope_to_catch_curb_branch = Branch.create(name: "hope to catch passenger at curb")
    ending_questions_branch = Branch.create(name: "ending questions")

    # create question types
    many_choice = QuestionType.create(name: "select-multiple")
    single_choice = QuestionType.create(name: "select-one")
    rank = QuestionType.create(name: "rank")

    # create nodes per branch, and questions for nodes, and answers for questions
    #
    # scenario questions
    # TODO: add icon names for all

    sq1 = Node.create(nickname: "SQ 1", is_decision_point: false, branch_id: scenario_questions_branch.id, template_name: "sq-1")
      sq1q = Question.create(node_id: sq1.id, question: "About how far away from LAX do you live?", question_type_id: single_choice.id)
      # ^ needs a question type
        sq1a1 = Answer.create(question_id: sq1q.id, answer: "Less than 30 minute drive away", icon_name: nil)
        sq1a2 = Answer.create(question_id: sq1q.id, answer: "30 - 60 minutes away", icon_name: nil)
        sq1a3 = Answer.create(question_id: sq1q.id, answer: "1 - 2 hours away", icon_name: nil)
        sq1a4 = Answer.create(question_id: sq1q.id, answer: "2 - 4 hours away", icon_name: nil)
        sq1a5 = Answer.create(question_id: sq1q.id, answer: "More than 4 hours away", icon_name: nil)

    sq22 = Node.create(nickname: "SQ 2.2", is_decision_point: false , branch_id: scenario_questions_branch.id, template_name: "sq-2-2")
      sq22q = Question.create(
        node_id: sq22.id,
        question: "You are the chosen one, selected to pick up XXX. There will be X passengers you need to pick up. They will have XXX with them",
        question_type_id: single_choice.name
      )

    sq31 = Node.create(nickname: "SQ 3.1", is_decision_point: false , branch_id: scenario_questions_branch.id, template_name: "sq-3-3")
      sq31q = Question.create(
        node_id: sq31.id,
        question: "Flight Number XXX from XXX is coming and will land in X. The traffic forecast is XXX.",
        question_type_id: single_choice.name
      )

    sq35 = Node.create(nickname: "SQ 3.5", is_decision_point: false , branch_id: scenario_questions_branch.id, template_name: "sq-3-5")
      sq35q = Question.create(node_id: sq35.id, question: "There is a friend in the car helping you with this pick-up ", question_type_id: single_choice.id)
      # ^ This will either say this or an alternate based on a random generation

    gq1 = Node.create(nickname: "GQ 1", is_decision_point: false , branch_id: scenario_questions_branch.id, template_name: "gq-1")
      gq1q = Question.create(node_id: gq1.id, question: "Why do you choose this strategy? Select all that apply (minimum 1)", question_type_id: many_choice.id)
        gq1a1 = Answer.create(question_id: gq1q.id, answer: "To minimize the hassle for me", icon_name: nil)
        gq1a2 = Answer.create(question_id: gq1q.id, answer: "To make it convenient for my passenger", icon_name: nil)
        gq1a3 = Answer.create(question_id: gq1q.id, answer: "To get in and out of the airport as quickly as possible", icon_name: nil)
        gq1a4 = Answer.create(question_id: gq1q.id, answer: "To avoid paying for parking", icon_name: nil)
        gq1a5 = Answer.create(question_id: gq1q.id, answer: "Other (Explain)", icon_name: nil)

    # meet offsite at train ride
    # what is this?
    noitf1 = Node.create(nickname: "No-ITF 1", is_decision_point: false , branch_id: meet_offsite_branch.id, template_name: "no-itf-1")
      noitf1q = Question.create(
        node_id: noitf1.id,
        question: "To avoid all of this, we're trying to build an airport rail system that would make it easy for a passenger to meet you at a nearby location outside of the airport! \nWould you meet your passenger at this new location outside of the airport in light of the experience you had today?",
        question_type_id: single_choice.name
      )
        noitf1a1 = Answer.create(question_id: noitf1q.id, answer: "yes", icon_name: nil)
        noitf1a1 = Answer.create(question_id: noitf1q.id, answer: "no", icon_name: nil)

    itf2 = Node.create(nickname: "ITF 2", is_decision_point: false , branch_id: meet_offsite_branch.id, template_name: "itf-2")
      itf2q = Question.create(
        node_id: itf2.id,
        question: "Imagine that you have the power to customize this off site location. \nPick your top 3 amenities. ",
        question_type_id: rank.name
      )
        itf2a1= Answer.create(question_id: itf2q.id, answer: "Free short-term parking", icon_name: nil)
        itf2a2= Answer.create(question_id: itf2q.id, answer: "A way to make sure I know the status of my passenger’s flight.", icon_name: nil)
        itf2a3= Answer.create(question_id: itf2q.id, answer: "A nice waiting area, where I could get a cup of coffee or something to eat", icon_name: nil)
        itf2a4= Answer.create(question_id: itf2q.id, answer: "Easy ways to get in and out of the location", icon_name: nil)
        itf2a5= Answer.create(question_id: itf2q.id, answer: "WIFi", icon_name: nil)
        itf2a6= Answer.create(question_id: itf2q.id, answer: "Passenger Assistants", icon_name: nil)
        itf2a7= Answer.create(question_id: itf2q.id, answer: "Dog run/relief area", icon_name: nil)
        itf2a8= Answer.create(question_id: itf2q.id, answer: "Children’s Play Area", icon_name: nil)

    # wait offsite
    c1 = Node.create(nickname: "C 1", is_decision_point: false , branch_id: wait_offsite_branch.id, template_name: "c-1")
      c1q = Question.create(node_id: c1.id, question: "Where do you usually wait for your passenger?", question_type_id: single_choice.id)
        c1a1= Answer.create(question_id: c1q.id, answer: "Cellphone waiting lot", icon_name: nil)
        c1a2= Answer.create(question_id: c1q.id, answer: "Roadside near the airport", icon_name: nil)
        c1a3= Answer.create(question_id: c1q.id, answer: "Nearby Store", icon_name: nil)
        c1a4= Answer.create(question_id: c1q.id, answer: "Nearby Restaurant", icon_name: nil)

    c2 = Node.create(nickname: "C 2", is_decision_point: false , branch_id: wait_offsite_branch.id, template_name: "c-2")
      c2q = Question.create(node_id: c2.id, question: "How long do you expect to wait before driving into the terminal area?", question_type_id: single_choice.id)
        c2a1= Answer.create(question_id: c2q.id, answer: "Less than 15 minutes", icon_name: nil)
        c2a2= Answer.create(question_id: c2q.id, answer: "15 - 30 minutes", icon_name: nil)
        c2a3= Answer.create(question_id: c2q.id, answer: "30 - 60 minutes", icon_name: nil)
        c2a4= Answer.create(question_id: c2q.id, answer: "60 - 90 minutes", icon_name: nil)
        c2a4= Answer.create(question_id: c2q.id, answer: "More than 90 minutes", icon_name: nil)

    c4 = Node.create(nickname: "C 4", is_decision_point: false , branch_id: wait_offsite_branch.id, template_name: "c-4")
      c4q = Question.create(node_id: c4.id, question: "What is the longest you are willing to wait for your passenger?", question_type_id: single_choice.id)
        c4a1= Answer.create(question_id: c4q.id, answer: "Set duration...", icon_name: nil)

    # park and meet
    b1 = Node.create(nickname: "B 1", is_decision_point: false , branch_id: park_and_meet_branch.id, template_name: "b-1")
      b1q = Question.create(node_id: b1.id, question: "Why do you choose to park your car? Select all that apply:", question_type_id: many_choice.id)
      # ^ this will need alt question text
        b1a1= Answer.create(question_id: b1q.id, answer: "When convenient parking is available", icon_name: nil)
        b1a2= Answer.create(question_id: b1q.id, answer: "To avoid driving in traffic", icon_name: nil)
        b1a3= Answer.create(question_id: b1q.id, answer: "To meet my passenger in the terminal", icon_name: nil)
        b1a4= Answer.create(question_id: b1q.id, answer: "Other (Specify)", icon_name: nil)

    b2 = Node.create(nickname: "B 2", is_decision_point: false , branch_id: park_and_meet_branch.id, template_name: "b-2")
      b2q = Question.create(node_id: b2.id, question: "How long do you usually park for?", question_type_id: single_choice.id)
      # ^ this will need alt question text
        b2a1= Answer.create(question_id: b2q.id, answer: "Less than 30 minutes", icon_name: nil)
        b2a2= Answer.create(question_id: b2q.id, answer: "30 - 60 minutes", icon_name: nil)
        b2a3= Answer.create(question_id: b2q.id, answer: "60 - 90 minutes", icon_name: nil)
        b2a4= Answer.create(question_id: b2q.id, answer: "More than 90 minutes", icon_name: nil)

    b3 = Node.create(nickname: "B 3", is_decision_point: false , branch_id: park_and_meet_branch.id, template_name: "b-3")
      b3q = Question.create(node_id: b3.id, question: "What are you doing while you're parked? Select all that apply:", question_type_id: many_choice.id)
        b3a1= Answer.create(question_id: b3q.id, answer: "Waiting in my car", icon_name: nil)
        b3a2= Answer.create(question_id: b3q.id, answer: "Waiting in the terminal", icon_name: nil)
        b3a3= Answer.create(question_id: b3q.id, answer: "Shopping in the terminal", icon_name: nil)
        b3a4= Answer.create(question_id: b3q.id, answer: "Getting something to eat or drink in the terminal", icon_name: nil)
        b3a5= Answer.create(question_id: b3q.id, answer: "Other (Specify)", icon_name: nil)

    b4 = Node.create(nickname: "B 4", is_decision_point: false , branch_id: park_and_meet_branch.id, template_name: "b-4")
      b4q = Question.create(node_id: b4.id, question: "What is the longest you are willing to look for parking?", question_type_id: single_choice.id)
        b4a1 = Answer.create(question_id: b4q.id, answer: "Set duration...", icon_name: nil)

    # hope to catch
    a1 = Node.create(nickname: "A 1", is_decision_point: false , branch_id: hope_to_catch_curb_branch.id, template_name: "a-1")
      a1q = Question.create(node_id: a1.id, question: "How well do you think this strategy will work?", question_type_id: single_choice.id)
        a1a1 = Answer.create(question_id: a1q.id, answer: "Works like a charm every time", icon_name: nil)
        a1a2 = Answer.create(question_id: a1q.id, answer: "I might have to circle a few times, but it will eventually work", icon_name: nil)
        a1a3 = Answer.create(question_id: a1q.id, answer: "It's always bad, but it's better than parking", icon_name: nil)

    a2 = Node.create(nickname: "A 2", is_decision_point: false , branch_id: hope_to_catch_curb_branch.id, template_name: "a-2")
      a2q = Question.create(
        node_id: a2.id,
        question: "You're circling and don't see your passenger and think they may be late. How do you check for that information?",
        question_type_id: single_choice.name
      )
        a2a1 = Answer.create(question_id: a2q.id, answer: "Check mobile phone for flight information", icon_name: nil)
        a2a2 = Answer.create(question_id: a2q.id, answer: "Try to reach passenger", icon_name: nil)
        a2a3 = Answer.create(question_id: a2q.id, answer: "Park and go inside terminal", icon_name: nil)


    # ending questions
    e1 = Node.create(nickname: "E 1", is_decision_point: false , branch_id: ending_questions_branch.id, template_name: "e-1")
      e1q = Question.create(node_id: e1.id, question: "Passenger Pick Up Success!")
        e1a1 = Answer.create(question_id: e1q.id, answer: "Next", icon_name: nil)

    e2 = Node.create(nickname: "E 2", is_decision_point: false , branch_id: ending_questions_branch.id, template_name: "e-2")
      e2q = Question.create(
        node_id: e2.id,
        question: "Based on this scenario, we estimated you have circled around the terminal [X] times before picking up your passenger.\nIs this typical?",
        question_type_id: single_choice.name
      )
        e2a1 = Answer.create(question_id: e2q.id, answer: "Yes", icon_name: nil)
        e2a2 = Answer.create(question_id: e2q.id, answer: "No", icon_name: nil)

    e3 = Node.create(nickname: "E 3", is_decision_point: false , branch_id: ending_questions_branch.id, template_name: "e-3")
      e3q = Question.create(
        node_id: e3.id,
        question: "Based on this scenario, we estimated you spent [Calculated Game Time in Minutes] getting your passenger at the airport.\nIs this typical?",
        question_type_id: single_choice.name
      )
        e3a1 = Answer.create(question_id: e3q.id, answer: "Yes", icon_name: nil)
        e3a2 = Answer.create(question_id: e3q.id, answer: "No", icon_name: nil)

    e4 = Node.create(nickname: "E 4", is_decision_point: false , branch_id: ending_questions_branch.id, template_name: "e-4")
      e4q = Question.create(
        node_id: e4.id,
        question: "What was the reason for your last trip to LAX?",
        question_type_id: single_choice.name
      )
        e4a1 = Answer.create(question_id: e4q.id, answer: "Business or business-related travel", icon_name: nil)
        e4a2 = Answer.create(question_id: e4q.id, answer: "Leisure/vacation/visiting", icon_name: nil)
        e4a3 = Answer.create(question_id: e4q.id, answer: "Not travelling: Picking-up passenger", icon_name: nil)
        e4a4 = Answer.create(question_id: e4q.id, answer: "Not travelling: Dropping-off passenger", icon_name: nil)
        e4a5 = Answer.create(question_id: e4q.id, answer: "Antoher reason (Specify)", icon_name: nil)

    e5 = Node.create(nickname: "E 5", is_decision_point: false , branch_id: ending_questions_branch.id, template_name: "e-5")
      e5q = Question.create(
        node_id: e5.id,
        question: "About how often do you go to LAX?",
        question_type_id: single_choice.name
      )
        e5a1 = Answer.create(question_id: e5q.id, answer: "Less than once a year", icon_name: nil)
        e5a2 = Answer.create(question_id: e5q.id, answer: "1 - 2 times a year", icon_name: nil)
        e5a3 = Answer.create(question_id: e5q.id, answer: "3 - 6 times a year", icon_name: nil)
        e5a4 = Answer.create(question_id: e5q.id, answer: "6 - 9 times a year", icon_name: nil)
        e5a5 = Answer.create(question_id: e5q.id, answer: "More than 9 times a year", icon_name: nil)

    e6 = Node.create(nickname: "E 6", is_decision_point: false , branch_id: ending_questions_branch.id, template_name: "e-6")
      e6q = Question.create(
        node_id: e6.id,
        question: "And finally, my esteemed driver: How old are you?",
        question_type_id: single_choice.name
      )
        e6a1 = Answer.create(question_id: e6q.id, answer: "18 - 24", icon_name: nil)
        e6a2 = Answer.create(question_id: e6q.id, answer: "25 - 34", icon_name: nil)
        e6a3 = Answer.create(question_id: e6q.id, answer: "35 - 44", icon_name: nil)
        e6a4 = Answer.create(question_id: e6q.id, answer: "45 - 54", icon_name: nil)
        e6a5 = Answer.create(question_id: e6q.id, answer: "55 - 64", icon_name: nil)
        e6a6 = Answer.create(question_id: e6q.id, answer: "65 - 74", icon_name: nil)
        e6a7 = Answer.create(question_id: e6q.id, answer: "75+", icon_name: nil)

    e7 = Node.create(nickname: "E 7", is_decision_point: false , branch_id: ending_questions_branch.id, template_name: "e-7")
      e7q = Question.create(
        node_id: e7.id,
        question: "You made it home!\nThank you for playing. All this information will help LAX better serve you in the future. If you want to keep in touch with our progress towards the new location please join our mailing list or visit us at http://connectinglax.com",
        question_type_id: single_choice.name
      )
        e7a1 = Answer.create(question_id: e7q.id, answer: "Email Input", icon_name: nil)

    # where does this go/branch name?
    # itf1 = Node.create(nickname: "ITF 1", is_decision_point: false , branch_id: ending_questions_branch.id)

    # Decision Points
    dp1 = Node.create(nickname: "DP 1", is_decision_point: true , branch_id: scenario_questions_branch.id, template_name: "dp-1")
      dp1dp = DecisionPoint.create(node_id: dp1.id, situation: "What is your strategy for picking up your passenger?")
        dp1d1 = Decision.create(decision_point_id: dp1dp.id, decision: "Park and meet your passenger inside the terminal", destination_node_id: b1.id)
        dp1d2 = Decision.create(decision_point_id: dp1dp.id, decision: "Hope to catch your passenger at the curb", destination_node_id: a1.id)
        dp1d3 = Decision.create(decision_point_id: dp1dp.id, decision: "Wait off site until passenger is ready to be picked up at the curb", destination_node_id: c1.id)
        dp1d4 = Decision.create(decision_point_id: dp1dp.id, decision: "Meet at an offsite location that has a short train ride to the terminals", destination_node_id: noitf1.id)

    dp7 = Node.create(nickname: "DP 7", is_decision_point: true , branch_id: wait_offsite_branch.id, template_name: "dp-7")
      dp7dp = DecisionPoint.create(node_id: dp7.id, situation: "The passenger is late. What do you do next?")
        dp7d1 = Decision.create(decision_point_id: dp7dp.id, decision: "Go park in the terminal parking area", destination_node_id: b1.id)
        dp7d2 = Decision.create(decision_point_id: dp7dp.id, decision: "Hope to catch your passenger at the curb", destination_node_id: a2.id)
        dp7d3 = Decision.create(decision_point_id: dp7dp.id, decision: "Keep waiting", destination_node_id: c4.id)

    dp7a = Node.create(nickname: "DP 7a", is_decision_point: true , branch_id: wait_offsite_branch.id, template_name: "dp-7a")
      dp7adp = DecisionPoint.create(node_id: dp7a.id, situation: "Is the passenger late?")
        dp7ad1 = Decision.create(decision_point_id: dp7adp.id, decision: "Yes", destination_node_id: dp7.id)
        dp7ad2 = Decision.create(decision_point_id: dp7adp.id, decision: "No", destination_node_id: e1.id)

    ## start weird intertwined DPs
    dp11 = Node.create(nickname: "DP 11", is_decision_point: true , branch_id: park_and_meet_branch.id, template_name: "dp-11")
    dp10 = Node.create(nickname: "DP 10", is_decision_point: true , branch_id: park_and_meet_branch.id, template_name: "dp-10")
    dp6 = Node.create(nickname: "DP 6", is_decision_point: true , branch_id: park_and_meet_branch.id, template_name: "dp-6")

      dp11dp = DecisionPoint.create(node_id: dp11.id, situation: "You've been looking for XX minutes with no luck. What now?")
        dp11d1 = Decision.create(decision_point_id: dp11dp.id, decision: "Keep trying", destination_node_id: dp10.id)
        dp11d2 = Decision.create(decision_point_id: dp11dp.id, decision: "Give up on parking", destination_node_id: dp6.id)

      dp10dp = DecisionPoint.create(node_id: dp10.id, situation: "Do you find parking?")
        dp10d1 = Decision.create(decision_point_id: dp10dp.id, decision: "Yes", destination_node_id: b4.id)
        dp10d2 = Decision.create(decision_point_id: dp10dp.id, decision: "No", destination_node_id: dp11.id)

      dp6dp = DecisionPoint.create(node_id: dp6.id, situation: "You finally arrive at the lot and the parking lot is full. What do you do next?")
        dp6d1 = Decision.create(decision_point_id: dp6dp.id, decision: "Wait until a parking spot opens up in the lot", destination_node_id: dp10.id)
        dp6d2 = Decision.create(decision_point_id: dp6dp.id, decision: "Exit parking structure and hope to catch your passenger at the curb", destination_node_id: a2.id)
        dp6d3 = Decision.create(decision_point_id: dp6dp.id, decision: "Exit terminal area to wait off site until passenger is ready to be picked up at the curb", destination_node_id: c1.id)
        dp6d4 = Decision.create(decision_point_id: dp6dp.id, decision: "Try to find a spot in another parking structure", destination_node_id: dp10.id)
    ## end weird intertwined DPs

    dp5 = Node.create(nickname: "DP 5", is_decision_point: true , branch_id: park_and_meet_branch.id, template_name: "dp-5")
      dp5dp = DecisionPoint.create(node_id: dp5.id, situation: "You arrive at the parking garage and find it is...")
        dp5d1 = Decision.create(decision_point_id: dp5dp.id, decision: "Not Full", destination_node_id: b4.id)
        dp5d2 = Decision.create(decision_point_id: dp5dp.id, decision: "Full", destination_node_id: dp6.id)

    dp3 = Node.create(nickname: "DP 3", is_decision_point: true , branch_id: hope_to_catch_curb_branch.id, template_name: "dp-3")
      dp3dp = DecisionPoint.create(node_id: dp3.id, situation: "What do you do now?")
        dp3d1 = Decision.create(decision_point_id: dp3dp.id, decision: "Continue Circling Around the airport", destination_node_id: e1.id)
        dp3d2 = Decision.create(decision_point_id: dp3dp.id, decision: "Park in the parking structure", destination_node_id: b1.id)
        dp3d3 = Decision.create(decision_point_id: dp3dp.id, decision: "Leave the airport and wait off site until the passenger is ready to be picked up at the curb ", destination_node_id: c1.id)

    dp2 = Node.create(nickname: "DP 2", is_decision_point: true , branch_id: hope_to_catch_curb_branch.id, template_name: "dp-2")
      dp2dp = DecisionPoint.create(node_id: dp2.id, situation: "You're almost at the terminal. Is your passenger there?")
        dp2d1 = Decision.create(decision_point_id: dp2dp.id, decision: "Yes", destination_node_id: e1.id)
        dp2d2 = Decision.create(decision_point_id: dp2dp.id, decision: "No", destination_node_id: dp3.id)

    # Update all existing question nodes to have next_node_ids
    sq1.update(next_node_id: sq22.id)
    sq22.update(next_node_id: sq31.id)
    sq31.update(next_node_id: sq35.id)
    sq35.update(next_node_id: dp1.id)
    a1.update(next_node_id: a2.id)
    a2.update(next_node_id: dp2.id)
    b1.update(next_node_id: b2.id)
    b2.update(next_node_id: b3.id)
    b3.update(next_node_id: dp5.id)
    b4.update(next_node_id: e1.id)
    c1.update(next_node_id: c2.id)
    c2.update(next_node_id: dp7.id)
    c4.update(next_node_id: e1.id)
    e1.update(next_node_id: e2.id)
    e2.update(next_node_id: e3.id)
    e3.update(next_node_id: e4.id)
    e4.update(next_node_id: e5.id)
    e5.update(next_node_id: e6.id)
    e6.update(next_node_id: e7.id)
    itf2.update(next_node_id: e4.id)

  end

end
