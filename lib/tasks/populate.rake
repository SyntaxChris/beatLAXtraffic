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
    mission_information_type = QuestionType.create(name: "mission-information")
    airport_information_type = QuestionType.create(name: "airport-information")
    gps_view_type = QuestionType.create(name: "gps-view")
    thought_bubble_ranking = QuestionType.create(name: "thought-bubble-ranking")
    yes_no_type = QuestionType.create(name: "yes-no")
    ranking_type = QuestionType.create(name: "ranking")
    signs_type = QuestionType.create(name: "signs")
    clock_type = QuestionType.create(name: "clock")
    coin_flip_type = QuestionType.create(name: "coin-flip")
    clock_v2_type = QuestionType.create(name: "clock-v2")
    table_type = QuestionType.create(name: "table")
    apps_type = QuestionType.create(name: "apps")

    # create nodes per branch, and questions for nodes, and answers for questions
    #
    # scenario questions
    # TODO: add icon names for all
    # TODO: add destination nodes once multi-directional nodes are done
    # TODO: add question type to DPs
    sq1 = Node.create(nickname: "SQ 1", is_decision_point: false, branch_id: scenario_questions_branch.id)
      sq1q = Question.create(node_id: sq1.id, question: "About how far away from LAX do you live?", question_type_id: nil)
      # ^ needs a question type
        sq1a1 = Answer.create(question_id: sq1q.id, answer: "Less than 30 minute drive away", icon_name: nil)
        sq1a2 = Answer.create(question_id: sq1q.id, answer: "30 - 60 minutes away", icon_name: nil)
        sq1a3 = Answer.create(question_id: sq1q.id, answer: "1 - 2 hours away", icon_name: nil)
        sq1a4 = Answer.create(question_id: sq1q.id, answer: "2 - 4 hours away", icon_name: nil)
        sq1a5 = Answer.create(question_id: sq1q.id, answer: "More than 4 hours away", icon_name: nil)

    sq22 = Node.create(nickname: "SQ 2.2", is_decision_point: false , branch_id: scenario_questions_branch.id)
      sq22q = Question.create(
        node_id: sq22.id,
        question: "You are the chosen one, selected to pick up XXX. There will be X passengers you need to pick up. They will have XXX with them",
        question_type_id: mission_information_type.id
      )

    sq31 = Node.create(nickname: "SQ 3.1", is_decision_point: false , branch_id: scenario_questions_branch.id)
      sq31q = Question.create(
        node_id: sq31.id,
        question: "Flight Number XXX from XXX is coming and will land in X. The traffic forecast is XXX.",
        question_type_id: airport_information_type.id
      )

    sq35 = Node.create(nickname: "SQ 3.5", is_decision_point: false , branch_id: scenario_questions_branch.id)
      sq35q = Question.create(node_id: sq35.id, question: "There is a friend in the car helping you with this pick-up ", question_type_id: airport_information_type.id)
      # ^ This will either say this or an alternate based on a random generation

    dp1 = Node.create(nickname: "DP 1", is_decision_point: true , branch_id: scenario_questions_branch.id)
      dp1dp = DecisionPoint.create(node_id: dp1.id, situation: "What is your strategy for picking up your passenger?")
        dp1d1 = Decision.create(decision_point_id: dp1dp.id, decision: "Park and meet your passenger inside the terminal")
        dp1d2 = Decision.create(decision_point_id: dp1dp.id, decision: "Hope to catch your passenger at the curb")
        dp1d3 = Decision.create(decision_point_id: dp1dp.id, decision: "Wait off site until passenger is ready to be picked up at the curb")
        dp1d4 = Decision.create(decision_point_id: dp1dp.id, decision: "Meet at an offsite location that has a short train ride to the terminals")

    gq1 = Node.create(nickname: "GQ 1", is_decision_point: false , branch_id: scenario_questions_branch.id)
      gq1q = Question.create(node_id: gq1.id, question: "Why do you choose this strategy? Select all that apply (minimum 1)", question_type_id: thought_bubble_ranking.id)
        gq1a1 = Answer.create(question_id: gq1q.id, answer: "To minimize the hassle for me", icon_name: nil)
        gq1a2 = Answer.create(question_id: gq1q.id, answer: "To make it convenient for my passenger", icon_name: nil)
        gq1a3 = Answer.create(question_id: gq1q.id, answer: "To get in and out of the airport as quickly as possible", icon_name: nil)
        gq1a4 = Answer.create(question_id: gq1q.id, answer: "To avoid paying for parking", icon_name: nil)
        gq1a5 = Answer.create(question_id: gq1q.id, answer: "Other (Explain)", icon_name: nil)

    # meet offsite at train ride
    # what is this?
    noitf1 = Node.create(nickname: "No-ITF 1", is_decision_point: false , branch_id: meet_offsite_branch.id)
      noitf1q = Question.create(
        node_id: noitf1.id,
        question: "To avoid all of this, we're trying to build an airport rail system that would make it easy for a passenger to meet you at a nearby location outside of the airport! \nWould you meet your passenger at this new location outside of the airport in light of the experience you had today?",
        question_type_id: yes_no_type.id
      )
        noitf1a1 = Answer.create(question_id: noitf1q.id, answer: "yes", icon_name: nil)
        noitf1a1 = Answer.create(question_id: noitf1q.id, answer: "no", icon_name: nil)

    itf2 = Node.create(nickname: "ITF 2", is_decision_point: false , branch_id: meet_offsite_branch.id)
      itf2q = Question.create(
        node_id: itf2.id,
        question: "Imagine that you have the power to customize this off site location. \nPick your top 3 amenities. ",
        question_type_id: ranking_type.id
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
    c1 = Node.create(nickname: "C 1", is_decision_point: false , branch_id: wait_offsite_branch.id)
      c1q = Question.create(node_id: c1.id, question: "Where do you usually wait for your passenger?", question_type_id: signs_type.id)
        c1a1= Answer.create(question_id: c1q.id, answer: "Cellphone waiting lot", icon_name: nil)
        c1a2= Answer.create(question_id: c1q.id, answer: "Roadside near the airport", icon_name: nil)
        c1a3= Answer.create(question_id: c1q.id, answer: "Nearby Store", icon_name: nil)
        c1a4= Answer.create(question_id: c1q.id, answer: "Nearby Restaurant", icon_name: nil)

    c2 = Node.create(nickname: "C 2", is_decision_point: false , branch_id: wait_offsite_branch.id)
      c2q = Question.create(node_id: c2.id, question: "How long do you expect to wait before driving into the terminal area?", question_type_id: clock_type.id)
        c2a1= Answer.create(question_id: c2q.id, answer: "Less than 15 minutes", icon_name: nil)
        c2a2= Answer.create(question_id: c2q.id, answer: "15 - 30 minutes", icon_name: nil)
        c2a3= Answer.create(question_id: c2q.id, answer: "30 - 60 minutes", icon_name: nil)
        c2a4= Answer.create(question_id: c2q.id, answer: "60 - 90 minutes", icon_name: nil)
        c2a4= Answer.create(question_id: c2q.id, answer: "More than 90 minutes", icon_name: nil)

    dp7a = Node.create(nickname: "DP 7a", is_decision_point: true , branch_id: wait_offsite_branch.id)
      dp7adp = DecisionPoint.create(node_id: dp7a.id, situation: "Is the passenger late?")
        dp7ad1 = Decision.create(decision_point_id: dp7adp.id, decision: "Yes")
        dp7ad2 = Decision.create(decision_point_id: dp7adp.id, decision: "No")

    dp7 = Node.create(nickname: "DP 7", is_decision_point: true , branch_id: wait_offsite_branch.id, decision_id: dp7ad1)
      dp7dp = DecisionPoint.create(node_id: dp7.id, situation: "The passenger is late. What do you do next?")
        dp7d1 = Decision.create(decision_point_id: dp7dp.id, decision: "Go park in the terminal parking area")
        dp7d2 = Decision.create(decision_point_id: dp7dp.id, decision: "Hope to catch your passenger at the curb")
        dp7d3 = Decision.create(decision_point_id: dp7dp.id, decision: "Keep waiting")

    c4 = Node.create(nickname: "C 4", is_decision_point: false , branch_id: wait_offsite_branch.id, decision_id: dp7d3)
      c4q = Question.create(node_id: c4.id, question: "What is the longest you are willing to wait for your passenger?", question_type_id: clock_v2_type.id)
        c4a1= Answer.create(question_id: c4q.id, answer: "Set duration...", icon_name: nil)

    # park and meet
    b1 = Node.create(nickname: "B 1", is_decision_point: false , branch_id: park_and_meet_branch.id)
      b1q = Question.create(node_id: b1.id, question: "Why do you choose to park your car? Select all that apply:", question_type_id: table_type.id)
      # ^ this will need alt question text
        b1a1= Answer.create(question_id: b1q.id, answer: "If convenient parking is available", icon_name: nil)
        b1a2= Answer.create(question_id: b1q.id, answer: "To avoid driving in traffic", icon_name: nil)
        b1a3= Answer.create(question_id: b1q.id, answer: "To meet my passenger in the terminal", icon_name: nil)
        b1a4= Answer.create(question_id: b1q.id, answer: "Other (Specify)", icon_name: nil)

    b2 = Node.create(nickname: "B 2", is_decision_point: false , branch_id: park_and_meet_branch.id)
      b2q = Question.create(node_id: b2.id, question: "How long do you usually park for?", question_type_id: clock_type.id)
      # ^ this will need alt question text
        b2a1= Answer.create(question_id: b2q.id, answer: "Less than 30 minutes", icon_name: nil)
        b2a2= Answer.create(question_id: b2q.id, answer: "30 - 60 minutes", icon_name: nil)
        b2a3= Answer.create(question_id: b2q.id, answer: "60 - 90 minutes", icon_name: nil)
        b2a4= Answer.create(question_id: b2q.id, answer: "More than 90 minutes", icon_name: nil)

    b3 = Node.create(nickname: "B 3", is_decision_point: false , branch_id: park_and_meet_branch.id)
      b3q = Question.create(node_id: b3.id, question: "What are you doing while you're parked? Select all that apply:", question_type_id: apps_type.id)
        b3a1= Answer.create(question_id: b3q.id, answer: "Waiting in my car", icon_name: nil)
        b3a2= Answer.create(question_id: b3q.id, answer: "Waiting in the terminal", icon_name: nil)
        b3a3= Answer.create(question_id: b3q.id, answer: "Shopping in the terminal", icon_name: nil)
        b3a4= Answer.create(question_id: b3q.id, answer: "Getting something to eat or drink in the terminal", icon_name: nil)
        b3a5= Answer.create(question_id: b3q.id, answer: "Other (Specify)", icon_name: nil)

    dp5 = Node.create(nickname: "DP 5", is_decision_point: true , branch_id: park_and_meet_branch.id)

    dp6 = Node.create(nickname: "DP 6", is_decision_point: true , branch_id: park_and_meet_branch.id)

    dp10 = Node.create(nickname: "DP 10", is_decision_point: true , branch_id: park_and_meet_branch.id)

    b4 = Node.create(nickname: "B 4", is_decision_point: false , branch_id: park_and_meet_branch.id)

    dp11 = Node.create(nickname: "DP 11", is_decision_point: true , branch_id: park_and_meet_branch.id)

    # hope to catch
    a1 = Node.create(nickname: "A 1", is_decision_point: false , branch_id: hope_to_catch_curb_branch.id)

    a2 = Node.create(nickname: "A 2", is_decision_point: false , branch_id: hope_to_catch_curb_branch.id)

    dp2 = Node.create(nickname: "DP 2", is_decision_point: false , branch_id: hope_to_catch_curb_branch.id)

    dp3 = Node.create(nickname: "DP 3", is_decision_point: false , branch_id: hope_to_catch_curb_branch.id)

    # ending questions
    e1 = Node.create(nickname: "E 1", is_decision_point: false , branch_id: ending_questions_branch.id)

    e2 = Node.create(nickname: "E 2", is_decision_point: false , branch_id: ending_questions_branch.id)

    e3 = Node.create(nickname: "E 3", is_decision_point: false , branch_id: ending_questions_branch.id)

    e4 = Node.create(nickname: "E 4", is_decision_point: false , branch_id: ending_questions_branch.id)

    e5 = Node.create(nickname: "E 5", is_decision_point: false , branch_id: ending_questions_branch.id)

    e6 = Node.create(nickname: "E 6", is_decision_point: false , branch_id: ending_questions_branch.id)

    e7 = Node.create(nickname: "E 7", is_decision_point: false , branch_id: ending_questions_branch.id)


    # where does this go/branch name?
    itf1 = Node.create(nickname: "ITF 1", is_decision_point: false , branch_id: ending_questions_branch.id)

  end

end
