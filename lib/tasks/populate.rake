
# usage: rake populate:create_nodes

namespace :populate do
  desc "creates all the nodes for the flow map"
  task create_nodes: :environment do
    # Drop, create and migrate database
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke

    # create branches
    blue = Branch.create(name: "blue")
    purple = Branch.create(name: "purple")
    green = Branch.create(name: "green")
    orange = Branch.create(name: "orange")

    # create question types
    many_choice = QuestionType.create(name: "select-multiple")
    single_choice = QuestionType.create(name: "select-one")
    rank = QuestionType.create(name: "rank")

    # create nodes per branch, and questions for nodes, and answers for questions
    #
    # scenario questions
    # TODO: add icon names for all

    splash = Node.create(nickname: "Splash", is_decision_point: false, branch_id: blue.id, template_name: "splash")
      splashq = Question.create(node_id: splash.id, question: " ", question_type_id: single_choice.id)
        splashqa1 = Answer.create(question_id: splashq.id, answer: "Splash screen seen", icon_name: nil)

    sq1 = Node.create(nickname: "SQ 1", is_decision_point: false, branch_id: blue.id, template_name: "sq-1")
      sq1q = Question.create(node_id: sq1.id, question: "Where in LA are you coming from?", question_type_id: single_choice.id)
      # ^ needs a question type
        # sq1a1 = Answer.create(question_id: sq1q.id, answer: "Less than 30 minute drive away", icon_name: nil)
        # sq1a2 = Answer.create(question_id: sq1q.id, answer: "30 - 60 minutes away", icon_name: nil)
        # sq1a3 = Answer.create(question_id: sq1q.id, answer: "1 - 2 hours away", icon_name: nil)
        # sq1a4 = Answer.create(question_id: sq1q.id, answer: "2 - 4 hours away", icon_name: nil)
        # sq1a5 = Answer.create(question_id: sq1q.id, answer: "More than 4 hours away", icon_name: nil)

    sq22 = Node.create(nickname: "SQ 2.2", is_decision_point: false , branch_id: blue.id, template_name: "sq-2-2")
      sq22q = Question.create(
        node_id: sq22.id,
        question: "You are the chosen one, selected to pick up XXX. There will be X passengers you need to pick up. They will have XXX with them",
        question_type_id: single_choice.id
      )

    #sq31 = Node.create(nickname: "SQ 3.1", is_decision_point: false , branch_id: scenario_questions_branch.id, template_name: "sq-3-3")
    #  sq31q = Question.create(
    #    node_id: sq31.id,
    #    question: "Flight Number XXX from XXX is coming and will land in X. The traffic forecast is XXX.",
    #    question_type_id: single_choice.id
    #  )

    #sq35 = Node.create(nickname: "SQ 3.5", is_decision_point: false , branch_id: scenario_questions_branch.id, template_name: "sq-3-5")
    #  sq35q = Question.create(node_id: sq35.id, question: "There is a friend in the car helping you with this pick-up ", question_type_id: single_choice.id)
      # ^ This will either say this or an alternate based on a random generation

    gq1a = Node.create(nickname: "GQ 1 A", is_decision_point: false , branch_id: blue.id, template_name: "gq-1-a", dashboard_type: "plane")
      gq1aq = Question.create(node_id: gq1a.id, question: "Why do you choose this strategy?", question_type_id: many_choice.id)
        gq1aa1 = Answer.create(question_id: gq1aq.id, answer: "To minimize the hassle for me", icon_name: nil)
        gq1aa2 = Answer.create(question_id: gq1aq.id, answer: "To make it convenient for my passenger", icon_name: nil)
        gq1aa3 = Answer.create(question_id: gq1aq.id, answer: "To get in and out of the airport as quickly as possible", icon_name: nil)
        gq1aa4 = Answer.create(question_id: gq1aq.id, answer: "To avoid paying for parking", icon_name: nil)
        gq1aa5 = Answer.create(question_id: gq1aq.id, answer: "Other (Explain)", icon_name: nil)

    gq1b = Node.create(nickname: "GQ 1 B", is_decision_point: false , branch_id: blue.id, template_name: "gq-1-b", dashboard_type: "plane")
      gq1bq = Question.create(node_id: gq1b.id, question: "Why do you choose this strategy?", question_type_id: many_choice.id)
        gq1ba1 = Answer.create(question_id: gq1bq.id, answer: "To minimize the hassle for me", icon_name: nil)
        gq1ba2 = Answer.create(question_id: gq1bq.id, answer: "To make it convenient for my passenger", icon_name: nil)
        gq1ba3 = Answer.create(question_id: gq1bq.id, answer: "To get in and out of the airport as quickly as possible", icon_name: nil)
        gq1ba4 = Answer.create(question_id: gq1bq.id, answer: "To avoid paying for parking", icon_name: nil)
        gq1ba5 = Answer.create(question_id: gq1bq.id, answer: "Other (Explain)", icon_name: nil)

    gq1c = Node.create(nickname: "GQ 1 C", is_decision_point: false , branch_id: blue.id, template_name: "gq-1-c", dashboard_type: "plane")
      gq1cq = Question.create(node_id: gq1c.id, question: "Why do you choose this strategy?", question_type_id: many_choice.id)
        gq1ca1 = Answer.create(question_id: gq1cq.id, answer: "To minimize the hassle for me", icon_name: nil)
        gq1ca2 = Answer.create(question_id: gq1cq.id, answer: "To make it convenient for my passenger", icon_name: nil)
        gq1ca3 = Answer.create(question_id: gq1cq.id, answer: "To get in and out of the airport as quickly as possible", icon_name: nil)
        gq1ca4 = Answer.create(question_id: gq1cq.id, answer: "To avoid paying for parking", icon_name: nil)
        gq1ca5 = Answer.create(question_id: gq1cq.id, answer: "Other (Explain)", icon_name: nil)

    gq1itf = Node.create(nickname: "GQ 1 ITF", is_decision_point: false , branch_id: blue.id, template_name: "gq-1-itf", dashboard_type: "plane")
      gq1itfq = Question.create(node_id: gq1itf.id, question: "Why do you choose this strategy?", question_type_id: many_choice.id)
        gq1itfa1 = Answer.create(question_id: gq1itfq.id, answer: "To minimize the hassle for me", icon_name: nil)
        gq1itfa2 = Answer.create(question_id: gq1itfq.id, answer: "To make it convenient for my passenger", icon_name: nil)
        gq1itfa3 = Answer.create(question_id: gq1itfq.id, answer: "To get in and out of the airport as quickly as possible", icon_name: nil)
        gq1itfa4 = Answer.create(question_id: gq1itfq.id, answer: "To avoid paying for parking", icon_name: nil)
        gq1itfa5 = Answer.create(question_id: gq1itfq.id, answer: "Other (Explain)", icon_name: nil)

    ns4 = Node.create(nickname: "NS 4", is_decision_point: false , branch_id: orange.id, template_name: "ns-4", dashboard_type: "car")
      ns4q = Question.create(node_id: ns4.id, question: "Nice! This location is part of the largest improvement project ever at LAX.\nWe'd love to hear how this project can help you and your passengers navigate LAX better", question_type_id: single_choice.id)
        ns4qa1 = Answer.create(question_id: ns4q.id, answer: "NS 4 answer", icon_name: nil)

    ns4noitf = Node.create(nickname: "NS 4 NO ITF", is_decision_point: false , branch_id: orange.id, template_name: "ns-4-no-itf", dashboard_type: "car")
      ns4noitfq = Question.create(node_id: ns4noitf.id, question: "Nice! This location is part of the largest improvement project ever at LAX.\nWe'd love to hear how this project can help you and your passengers navigate LAX better", question_type_id: single_choice.id)
        ns4noitfqa1 = Answer.create(question_id: ns4noitfq.id, answer: "NS 4 NO ITF answer", icon_name: nil)

    ns5noitf = Node.create(nickname: "NS 5 NO ITF", is_decision_point: false , branch_id: orange.id, template_name: "ns-5-no-itf", dashboard_type: "car")
      ns5noitfq = Question.create(node_id: ns5noitf.id, question: "We're actually currently working on building this new location and want to make sure you find it as useful as possible. We want your input on how we should build this location.", question_type_id: single_choice.id)
        ns5noitfqa1 = Answer.create(question_id: ns5noitfq.id, answer: "NS 5 NO ITF answer", icon_name: nil)

    # meet offsite at train ride
    # what is this?

    itf2 = Node.create(nickname: "ITF 2", is_decision_point: false , branch_id: orange.id, template_name: "itf-2", dashboard_type: "car")
      itf2q = Question.create(
        node_id: itf2.id,
        question: "Which of these amenities would you prioritize having? Select your top 3.",
        question_type_id: many_choice.id
      )
        itf2a1= Answer.create(question_id: itf2q.id, answer: "Free short-term parking", icon_name: "parking")
        itf2a2= Answer.create(question_id: itf2q.id, answer: "A way to make sure I know the status of my passenger’s flight.", icon_name: "computer")
        itf2a3= Answer.create(question_id: itf2q.id, answer: "A place to get food or a drink", icon_name: "food")
        itf2a4= Answer.create(question_id: itf2q.id, answer: "Easy ways to get in and out of the location", icon_name: "exit")
        itf2a5= Answer.create(question_id: itf2q.id, answer: "WIFi", icon_name: "wifi")
        itf2a6= Answer.create(question_id: itf2q.id, answer: "A comfortable waiting area", icon_name: "couch")
        itf2a7= Answer.create(question_id: itf2q.id, answer: "Wheelchair/Disabled Assistants", icon_name: "helpdesk")
        itf2a8= Answer.create(question_id: itf2q.id, answer: "Dog run/relief area", icon_name: "dog")
        itf2a9= Answer.create(question_id: itf2q.id, answer: "Children’s Play Area", icon_name: "family")

    itf3 = Node.create(nickname: "ITF 3", is_decision_point: false , branch_id: orange.id, template_name: "itf-3", dashboard_type: "car")
      itf3q = Question.create(
        node_id: itf3.id,
        question: "Which of these amenities would you prioritize having? Select your top 3.",
        question_type_id: many_choice.id
      )
        itf3a1= Answer.create(question_id: itf3q.id, answer: "Free short-term parking", icon_name: "parking")
        itf3a2= Answer.create(question_id: itf3q.id, answer: "A way to make sure I know the status of my passenger’s flight.", icon_name: "computer")
        itf3a3= Answer.create(question_id: itf3q.id, answer: "A place to get food or a drink", icon_name: "food")
        itf3a4= Answer.create(question_id: itf3q.id, answer: "Easy ways to get in and out of the location", icon_name: "exit")
        itf3a5= Answer.create(question_id: itf3q.id, answer: "WIFi", icon_name: "wifi")
        itf3a6= Answer.create(question_id: itf3q.id, answer: "A comfortable waiting area", icon_name: "couch")
        itf3a7= Answer.create(question_id: itf3q.id, answer: "Wheelchair/Disabled Assistants", icon_name: "helpdesk")
        itf3a8= Answer.create(question_id: itf3q.id, answer: "Valet Parking", icon_name: "valet")
        itf3a9= Answer.create(question_id: itf3q.id, answer: "Bag Check-in/Drop Off", icon_name: "bagcheck")

    itf2noitf = Node.create(nickname: "ITF 2 NO ITF", is_decision_point: false , branch_id: orange.id, template_name: "itf-2-no-itf")
      itf2noitfq = Question.create(
        node_id: itf2noitf.id,
        question: "Which of these amenities would you prioritize having? Select your top 3.",
        question_type_id: many_choice.id
      )
        itf2noitfa1= Answer.create(question_id: itf2noitfq.id, answer: "Free short-term parking", icon_name: "parking")
        itf2noitfa2= Answer.create(question_id: itf2noitfq.id, answer: "A way to make sure I know the status of my passenger’s flight.", icon_name: "computer")
        itf2noitfa3= Answer.create(question_id: itf2noitfq.id, answer: "A place to get food or a drink", icon_name: "food")
        itf2noitfa4= Answer.create(question_id: itf2noitfq.id, answer: "Easy ways to get in and out of the location", icon_name: "exit")
        itf2noitfa5= Answer.create(question_id: itf2noitfq.id, answer: "WIFi", icon_name: "wifi")
        itf2noitfa6= Answer.create(question_id: itf2noitfq.id, answer: "A comfortable waiting area", icon_name: "couch")
        itf2noitfa7= Answer.create(question_id: itf2noitfq.id, answer: "Wheelchair/Disabled Assistants", icon_name: "helpdesk")
        itf2noitfa8= Answer.create(question_id: itf2noitfq.id, answer: "Dog run/relief area", icon_name: "dog")
        itf2noitfa9= Answer.create(question_id: itf2noitfq.id, answer: "Children’s Play Area", icon_name: "family")

    itf3noitf = Node.create(nickname: "ITF 3 NO ITF", is_decision_point: false , branch_id: orange.id, template_name: "itf-3-no-itf")
      itf3noitfq = Question.create(
        node_id: itf3noitf.id,
        question: "Which of these amenities would you prioritize having? Select your top 3.",
        question_type_id: many_choice.id
      )
        itf3noitfa1= Answer.create(question_id: itf3noitfq.id, answer: "Free short-term parking", icon_name: "parking")
        itf3noitfa2= Answer.create(question_id: itf3noitfq.id, answer: "A way to make sure I know the status of my passenger’s flight.", icon_name: "computer")
        itf3noitfa3= Answer.create(question_id: itf3noitfq.id, answer: "A place to get food or a drink", icon_name: "food")
        itf3noitfa4= Answer.create(question_id: itf3noitfq.id, answer: "Easy ways to get in and out of the location", icon_name: "exit")
        itf3noitfa5= Answer.create(question_id: itf3noitfq.id, answer: "WIFi", icon_name: "wifi")
        itf3noitfa6= Answer.create(question_id: itf3noitfq.id, answer: "A comfortable waiting area", icon_name: "couch")
        itf3noitfa7= Answer.create(question_id: itf3noitfq.id, answer: "Wheelchair/Disabled Assistants", icon_name: "helpdesk")
        itf3noitfa8= Answer.create(question_id: itf3noitfq.id, answer: "Valet Parking", icon_name: "valet")
        itf3noitfa9= Answer.create(question_id: itf3noitfq.id, answer: "Bag Check-in/Drop Off", icon_name: "bagcheck")

    # wait offsite
    c1 = Node.create(nickname: "C 1", is_decision_point: false , branch_id: orange.id, template_name: "c-1", dashboard_type: "plane")
      c1q = Question.create(node_id: c1.id, question: "Where do you usually wait for your passenger?", question_type_id: single_choice.id)
        c1a1= Answer.create(question_id: c1q.id, answer: "Cellphone waiting lot", icon_name: nil)
        c1a2= Answer.create(question_id: c1q.id, answer: "Roadside near the airport", icon_name: nil)
        c1a3= Answer.create(question_id: c1q.id, answer: "Nearby Store", icon_name: nil)
        c1a4= Answer.create(question_id: c1q.id, answer: "Nearby Restaurant", icon_name: nil)

    c2 = Node.create(nickname: "C 2", is_decision_point: false , branch_id: orange.id, template_name: "c-2", dashboard_type: "plane")
      c2q = Question.create(node_id: c2.id, question: "How long do you expect to wait before driving into the terminal area?", question_type_id: single_choice.id)
        c2a1= Answer.create(question_id: c2q.id, answer: "Less than 15 minutes", icon_name: nil, custom_order: 2)
        c2a2= Answer.create(question_id: c2q.id, answer: "15 - 30 minutes", icon_name: nil, custom_order: 4)
        c2a3= Answer.create(question_id: c2q.id, answer: "30 - 60 minutes", icon_name: nil, custom_order: 3)
        c2a4= Answer.create(question_id: c2q.id, answer: "More than 60 minutes", icon_name: nil, custom_order: 1)

    c4 = Node.create(nickname: "C 4", is_decision_point: false , branch_id: orange.id, template_name: "c-4", dashboard_type: "plane")
      c4q = Question.create(node_id: c4.id, question: "What is the longest you are willing to wait for your passenger?", question_type_id: single_choice.id)
        c4a1= Answer.create(question_id: c4q.id, answer: "Set duration...", icon_name: nil)

    # park and meet
    b1 = Node.create(nickname: "B 1", is_decision_point: false , branch_id: green.id, template_name: "b-1", dashboard_type: "plane")
      b1q = Question.create(node_id: b1.id, question: "Why do you choose to park your car?", question_type_id: many_choice.id)
      # ^ this will need alt question text
        b1a1= Answer.create(question_id: b1q.id, answer: "When convenient parking is available", icon_name: nil)
        b1a2= Answer.create(question_id: b1q.id, answer: "To avoid driving in traffic", icon_name: nil)
        b1a3= Answer.create(question_id: b1q.id, answer: "To meet my passenger in the terminal", icon_name: nil)
        b1a4= Answer.create(question_id: b1q.id, answer: "Other (Specify)", icon_name: nil)

    b2 = Node.create(nickname: "B 2", is_decision_point: false , branch_id: green.id, template_name: "b-2",  dashboard_type: "plane")
      b2q = Question.create(node_id: b2.id, question: "You need to time your parking correctly. How much time will you put in the meter?", question_type_id: single_choice.id)
      # ^ this will need alt question text
        b2a1= Answer.create(question_id: b2q.id, answer: "Less than 30 minutes", icon_name: nil, custom_order: 2)
        b2a2= Answer.create(question_id: b2q.id, answer: "30 - 60 minutes", icon_name: nil, custom_order: 4)
        b2a3= Answer.create(question_id: b2q.id, answer: "60 - 90 minutes", icon_name: nil, custom_order: 3)
        b2a4= Answer.create(question_id: b2q.id, answer: "More than 90 minutes", icon_name: nil, custom_order: 1)

    b3 = Node.create(nickname: "B 3", is_decision_point: false , branch_id: green.id, template_name: "b-3", dashboard_type: "plane")
      b3q = Question.create(node_id: b3.id, question: "What are you doing while you're parked?", question_type_id: many_choice.id)
        b3a1= Answer.create(question_id: b3q.id, answer: "Waiting in my car", icon_name: nil)
        b3a2= Answer.create(question_id: b3q.id, answer: "Waiting in the terminal", icon_name: nil)
        b3a3= Answer.create(question_id: b3q.id, answer: "Shopping in the terminal", icon_name: nil)
        b3a4= Answer.create(question_id: b3q.id, answer: "Getting food or a drink in the terminal", icon_name: nil)

    b4 = Node.create(nickname: "B 4", is_decision_point: false , branch_id: green.id, template_name: "b-4", dashboard_type: "plane")
      b4q = Question.create(node_id: b4.id, question: "What is the longest you are willing to look for parking?", question_type_id: single_choice.id)
        b4a1 = Answer.create(question_id: b4q.id, answer: "Set duration...", icon_name: nil)

    # hope to catch
    a1 = Node.create(nickname: "A 1", is_decision_point: false , branch_id: purple.id, template_name: "a-1", dashboard_type: "plane")
      a1q = Question.create(node_id: a1.id, question: "How well do you think this strategy will work?", question_type_id: single_choice.id)
        a1a1 = Answer.create(question_id: a1q.id, answer: "Works like a charm every time", icon_name: nil)
        a1a2 = Answer.create(question_id: a1q.id, answer: "I might have to circle a few times, but it will eventually work", icon_name: nil)
        a1a3 = Answer.create(question_id: a1q.id, answer: "It's always bad, but it's better than parking", icon_name: nil)

    a2 = Node.create(nickname: "A 2", is_decision_point: false , branch_id: purple.id, template_name: "a-2", dashboard_type: "plane")
      a2q = Question.create(
        node_id: a2.id,
        question: "You have a feeling your passenger will be late.\n How do you check for that?",
        question_type_id: single_choice.id
      )
        a2a1 = Answer.create(question_id: a2q.id, answer: "Check mobile phone for flight information", icon_name: nil)
        a2a2 = Answer.create(question_id: a2q.id, answer: "Try to reach passenger", icon_name: nil)
        a2a3 = Answer.create(question_id: a2q.id, answer: "Park and go inside terminal", icon_name: nil)


    # ending questions
    # success via A/B/C branch win
    e1 = Node.create(nickname: "E 1", is_decision_point: false , branch_id: blue.id, template_name: "e-1")
      e1q = Question.create(node_id: e1.id, question: "Passenger Pick Up Success!", question_type_id: single_choice.id)
        e1a1 = Answer.create(question_id: e1q.id, answer: "Next", icon_name: nil)

    # success via choice to go to an offsite tram
    e1itf = Node.create(nickname: "E 1 ITF", is_decision_point: false , branch_id: blue.id, template_name: "e-1-itf")
      e1itfq = Question.create(node_id: e1itf.id, question: "Passenger Pick Up Success!", question_type_id: single_choice.id)
        e1itfa1 = Answer.create(question_id: e1itfq.id, answer: "Next", icon_name: nil)

    e2 = Node.create(nickname: "E 2", is_decision_point: false , branch_id: blue.id, template_name: "e-2", dashboard_type: "car")
      e2q = Question.create(
        node_id: e2.id,
        question: "Based on this scenario, we estimated you have circled around the terminal [X] times before picking up your passenger.\nIs this typical?",
        question_type_id: single_choice.id
      )
        e2a1 = Answer.create(question_id: e2q.id, answer: "Yes", icon_name: nil)
        e2a2 = Answer.create(question_id: e2q.id, answer: "No", icon_name: nil)

    e3 = Node.create(nickname: "E 3", is_decision_point: false , branch_id: blue.id, template_name: "e-3", dashboard_type: "car")
      e3q = Question.create(
        node_id: e3.id,
        question: "Based on this game, we estimated you spent [Calculated Game Time in Minutes] getting your passenger at the airport.\nIs this typical?",
        question_type_id: single_choice.id
      )
        e3a1 = Answer.create(question_id: e3q.id, answer: "Yes", icon_name: nil)
        e3a2 = Answer.create(question_id: e3q.id, answer: "No", icon_name: nil)

    e4 = Node.create(nickname: "E 4", is_decision_point: false , branch_id: blue.id, template_name: "e-4", dashboard_type: "car")
      e4q = Question.create(
        node_id: e4.id,
        question: "What was the reason for your last trip to LAX?",
        question_type_id: single_choice.id
      )
        e4a1 = Answer.create(question_id: e4q.id, answer: "Business or business-related travel", icon_name: nil)
        e4a2 = Answer.create(question_id: e4q.id, answer: "Leisure/vacation/visiting", icon_name: nil)
        e4a3 = Answer.create(question_id: e4q.id, answer: "Not travelling: Picking-up passenger", icon_name: nil)
        e4a4 = Answer.create(question_id: e4q.id, answer: "Not travelling: Dropping-off passenger", icon_name: nil)
        e4a5 = Answer.create(question_id: e4q.id, answer: "Another reason (Specify)", icon_name: nil)

    e5 = Node.create(nickname: "E 5", is_decision_point: false , branch_id: blue.id, template_name: "e-5", dashboard_type: "car")
      e5q = Question.create(
        node_id: e5.id,
        question: "About how often do you go to LAX?",
        question_type_id: single_choice.id
      )
        e5a1 = Answer.create(question_id: e5q.id, answer: "Less than once a year", icon_name: nil)
        e5a2 = Answer.create(question_id: e5q.id, answer: "1 - 2 times a year", icon_name: nil)
        e5a3 = Answer.create(question_id: e5q.id, answer: "3 - 6 times a year", icon_name: nil)
        e5a4 = Answer.create(question_id: e5q.id, answer: "6 - 9 times a year", icon_name: nil)
        e5a5 = Answer.create(question_id: e5q.id, answer: "More than 9 times a year", icon_name: nil)

    e6 = Node.create(nickname: "E 6", is_decision_point: false , branch_id: blue.id, template_name: "e-6", dashboard_type: "car")
      e6q = Question.create(
        node_id: e6.id,
        question: "And finally, my esteemed driver: How old are you?",
        question_type_id: single_choice.id
      )
        e6a1 = Answer.create(question_id: e6q.id, answer: "18 - 24", icon_name: nil)
        e6a2 = Answer.create(question_id: e6q.id, answer: "25 - 34", icon_name: nil)
        e6a3 = Answer.create(question_id: e6q.id, answer: "35 - 44", icon_name: nil)
        e6a4 = Answer.create(question_id: e6q.id, answer: "45 - 54", icon_name: nil)
        e6a5 = Answer.create(question_id: e6q.id, answer: "55 - 64", icon_name: nil)
        e6a6 = Answer.create(question_id: e6q.id, answer: "65 - 74", icon_name: nil)
        e6a7 = Answer.create(question_id: e6q.id, answer: "75+", icon_name: nil)

    e7 = Node.create(nickname: "E 7", is_decision_point: false , branch_id: blue.id, template_name: "e-7")
      e7q = Question.create(
        node_id: e7.id,
        question: "You made it home!\nThank you for playing. All this information will help LAX better serve you in the future. If you want to keep in touch with our progress towards the new location please join our mailing list or visit us at http://connectinglax.com",
        question_type_id: single_choice.id
      )
        e7a1 = Answer.create(question_id: e7q.id, answer: "Email Input", icon_name: nil)

    # where does this go/branch name?
    # itf1 = Node.create(nickname: "ITF 1", is_decision_point: false , branch_id: ending_questions_branch.id)

    # Decision Points
    noitf1 = Node.create(nickname: "No-ITF 1", is_decision_point: true , branch_id: orange.id, template_name: "no-itf-1", dashboard_type: "car")
      noitf1dp = DecisionPoint.create(
        node_id: noitf1.id,
        situation: "To avoid all of this, we're trying to build an airport rail system that would make it easy for a passenger to meet you at a nearby location outside of the airport! \nIn the real world, would you consider picking up passengers at this new location for a better experience?"
      )
        noitf1d1 = Decision.create(decision_point_id: noitf1dp.id, decision: "Yes", destination_node_id: ns4noitf.id)
        noitf1d2 = Decision.create(decision_point_id: noitf1dp.id, decision: "No", destination_node_id: ns5noitf.id)

    dp1 = Node.create(nickname: "DP 1", is_decision_point: true , branch_id: blue.id, template_name: "dp-1", dashboard_type: "plane")
      dp1dp = DecisionPoint.create(node_id: dp1.id, situation: "What is your strategy for picking up your passenger?")
        dp1d1 = Decision.create(decision_point_id: dp1dp.id, decision: "Park and meet your passenger inside the terminal", destination_node_id: gq1b.id)
        dp1d2 = Decision.create(decision_point_id: dp1dp.id, decision: "Hope to catch your passenger at the curb", destination_node_id: gq1a.id)
        dp1d3 = Decision.create(decision_point_id: dp1dp.id, decision: "Leave and wait off site until passenger is ready to be picked up at the curb", destination_node_id: gq1c.id)
        dp1d4 = Decision.create(decision_point_id: dp1dp.id, decision: "Meet at a new facility that has a 10 min connecting tram to the terminals", destination_node_id: gq1itf.id)
        dp1d5 = Decision.create(decision_point_id: dp1dp.id, decision: "Default view", destination_node_id: b1.id)

    dp8 = Node.create(nickname: "DP 8", is_decision_point: true , branch_id: orange.id, template_name: "dp-8", dashboard_type: "plane")
      dp8dp = DecisionPoint.create(node_id: dp8.id, situation: "Your pick-up isn't calling and you can't reach them. What do you do now?")
        dp8d1 = Decision.create(decision_point_id: dp8dp.id, decision: "Go park in the terminal parking area", destination_node_id: b1.id)
        dp8d2 = Decision.create(decision_point_id: dp8dp.id, decision: "Hope to catch your passenger at the curb", destination_node_id: a1.id)
        dp8d3 = Decision.create(decision_point_id: dp8dp.id, decision: "Keep waiting", destination_node_id: c4.id)
        dp8d4 = Decision.create(decision_point_id: dp8dp.id, decision: "Go to an offsite location", destination_node_id: ns4.id)

    # TODO: need to re-do 7s. consult updated map
    dp7 = Node.create(nickname: "DP 7", is_decision_point: true , branch_id: orange.id, template_name: "dp-7", dashboard_type: "plane")
      dp7dp = DecisionPoint.create(node_id: dp7.id, situation: "Has your passenger called to be picked up?")
        dp7d1 = Decision.create(decision_point_id: dp7dp.id, decision: "Yes", destination_node_id: e1.id)
        dp7d2 = Decision.create(decision_point_id: dp7dp.id, decision: "No", destination_node_id: dp8.id)

    # i think this is no longer used?
    # TODO: remove
    dp7a = Node.create(nickname: "DP 7a", is_decision_point: true , branch_id: orange.id, template_name: "dp-7a", dashboard_type: "plane")
      dp7adp = DecisionPoint.create(node_id: dp7a.id, situation: "Is the passenger late?")
        dp7ad1 = Decision.create(decision_point_id: dp7adp.id, decision: "Yes", destination_node_id: dp7.id)
        dp7ad2 = Decision.create(decision_point_id: dp7adp.id, decision: "No", destination_node_id: noitf1.id)

    ## start weird intertwined DPs
    dp11 = Node.create(nickname: "DP 11", is_decision_point: true , branch_id: green.id, template_name: "dp-11", dashboard_type: "plane")
    dp10 = Node.create(nickname: "DP 10", is_decision_point: true , branch_id: green.id, template_name: "dp-10", dashboard_type: "plane")
    dp6 = Node.create(nickname: "DP 6", is_decision_point: true , branch_id: green.id, template_name: "dp-6", dashboard_type: "plane")

      dp11dp = DecisionPoint.create(node_id: dp11.id, situation: "You've been looking for XX minutes with no luck. What now?")
        dp11d1 = Decision.create(decision_point_id: dp11dp.id, decision: "Keep trying", destination_node_id: dp10.id)
        dp11d2 = Decision.create(decision_point_id: dp11dp.id, decision: "Give up", destination_node_id: dp6.id)

      dp10dp = DecisionPoint.create(node_id: dp10.id, situation: "Do you find parking?")
        dp10d1 = Decision.create(decision_point_id: dp10dp.id, decision: "Yes", destination_node_id: b4.id)
        dp10d2 = Decision.create(decision_point_id: dp10dp.id, decision: "No", destination_node_id: dp11.id)

      dp6dp = DecisionPoint.create(node_id: dp6.id, situation: "You finally arrive at the lot and the parking lot is full. What do you do next?")
        dp6d1 = Decision.create(decision_point_id: dp6dp.id, decision: "Go to another parking structure", destination_node_id: dp10.id)
        dp6d2 = Decision.create(decision_point_id: dp6dp.id, decision: "Hope to catch your passenger at the curb", destination_node_id: a1.id)
        dp6d3 = Decision.create(decision_point_id: dp6dp.id, decision: "Leave and wait off site until passenger is ready to be picked up at the curb", destination_node_id: c1.id)
        dp6d4 = Decision.create(decision_point_id: dp6dp.id, decision: "Meet at a new facility that has a 10 min connecting tram to the terminals", destination_node_id: ns4.id)
    ## end weird intertwined DPs

    dp5 = Node.create(nickname: "DP 5", is_decision_point: true , branch_id: green.id, template_name: "dp-5", dashboard_type: "plane")
      dp5dp = DecisionPoint.create(node_id: dp5.id, situation: "You arrive at the parking garage and find it is...")
        dp5d1 = Decision.create(decision_point_id: dp5dp.id, decision: "Not Full", destination_node_id: b4.id)
        dp5d2 = Decision.create(decision_point_id: dp5dp.id, decision: "Full", destination_node_id: dp6.id)

    dp3 = Node.create(nickname: "DP 3", is_decision_point: true , branch_id: purple.id, template_name: "dp-3", dashboard_type: "plane")
      dp3dp = DecisionPoint.create(node_id: dp3.id, situation: "What do you do now?")
        dp3d1 = Decision.create(decision_point_id: dp3dp.id, decision: "Park and meet your passenger inside the terminal", destination_node_id: b1.id)
        dp3d2 = Decision.create(decision_point_id: dp3dp.id, decision: "Continue circling around terminal") # destination for this relies on dp2 below
        dp3d3 = Decision.create(decision_point_id: dp3dp.id, decision: "Wait off site until passenger is ready to be picked up at the curb", destination_node_id: c1.id)
        dp3d4 = Decision.create(decision_point_id: dp3dp.id, decision: "Meet at a new facility that has a 10 min connecting tram to the terminals", destination_node_id: ns4.id)

    dp2 = Node.create(nickname: "DP 2", is_decision_point: true , branch_id: purple.id, template_name: "dp-2", dashboard_type: "plane")
      dp2dp = DecisionPoint.create(node_id: dp2.id, situation: "You're trying to pull-over and pick up your passenger in traffic. Are you successful?")
        dp2d1 = Decision.create(decision_point_id: dp2dp.id, decision: "Yes", destination_node_id: e1.id)
        dp2d2 = Decision.create(decision_point_id: dp2dp.id, decision: "No", destination_node_id: dp3.id)
    # update for dp3 after dp2's creation:
    dp3d2.update(destination_node_id: dp2.id)

    # Update all existing question nodes to have next_node_ids
    splash.update(next_node_id: sq22.id)
    sq22.update(next_node_id: sq1.id)
    sq1.update(next_node_id: dp1.id)
    # sq31.update(next_node_id: sq35.id)
    # sq35.update(next_node_id: dp1.id)
    gq1a.update(next_node_id: a1.id)
    gq1b.update(next_node_id: b1.id)
    gq1c.update(next_node_id: c1.id)
    gq1itf.update(next_node_id: ns4.id)
    a1.update(next_node_id: a2.id)
    a2.update(next_node_id: dp2.id)
    b1.update(next_node_id: b2.id)
    b2.update(next_node_id: b3.id)
    b3.update(next_node_id: dp5.id)
    b4.update(next_node_id: e1.id)
    c1.update(next_node_id: c2.id)
    c2.update(next_node_id: dp7.id)
    c4.update(next_node_id: e1.id)
    e1.update(next_node_id: noitf1.id)
    e1itf.update(next_node_id: e2.id)
    e2.update(next_node_id: e3.id)
    e3.update(next_node_id: e4.id)
    e4.update(next_node_id: e5.id)
    e5.update(next_node_id: e6.id)
    e6.update(next_node_id: e7.id)
    e7.update(next_node_id: splash.id)
    itf2.update(next_node_id: itf3.id)
    itf3.update(next_node_id: e1itf.id)
    itf2noitf.update(next_node_id: itf3noitf.id)
    itf3noitf.update(next_node_id: e2.id)
    ns4.update(next_node_id: itf2.id)
    ns4noitf.update(next_node_id: itf2noitf.id)
    ns5noitf.update(next_node_id: itf2noitf.id)

    # populate Answer.codebook_identifier scoped to each Question
    Question.all.each do |q|
      i = 0
      q.answers.order('id').each do |a|
        i += 1
        a.update(codebook_identifier: i)
      end
    end

    DecisionPoint.all.each do |dp|
      i = 0
      dp.decisions.order('id').each do |d|
        i += 1
        d.update(codebook_identifier: i)
      end
    end

    # clear any cached files after all data is loaded
    Rake::Task['cache:clear'].invoke
  end
end
