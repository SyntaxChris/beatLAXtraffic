
# usage: rake populate:create_nodes

namespace :populate do
  desc "creates admin accounts from ENV variables"
  task create_admins: :environment do

    a = 0
    Rails.application.secrets["admin_count"].times do
      a += 1

      admin = Admin.where(email: Rails.application.secrets["admin_email_#{a}"])
      if admin.count == 0
        admin = Admin.new({email: Rails.application.secrets["admin_email_#{a}"], password: Rails.application.secrets["admin_password_#{a}"], password_confirmation: Rails.application.secrets["admin_password_#{a}"]}).save(validate: false)
      end
    end

  end

  desc "creates all the nodes for the flow map"
  task create_nodes: :environment do
    # Drop, create and migrate database
    # Rake::Task['db:drop'].invoke
    # Rake::Task['db:create'].invoke
    # Rake::Task['db:migrate'].invoke

    Rake::Task['populate:create_admins'].invoke


    Branch.destroy_all
    QuestionType.destroy_all
    Node.destroy_all
    Question.destroy_all
    Answer.destroy_all
    DecisionPoint.destroy_all
    Decision.destroy_all

    # create branches
    blue = Branch.where(name: "blue").first_or_create
    purple = Branch.where(name: "purple").first_or_create
    green = Branch.where(name: "green").first_or_create
    orange = Branch.where(name: "orange").first_or_create

    # create question types
    many_choice = QuestionType.where(name: "select-multiple").first_or_create
    single_choice = QuestionType.where(name: "select-one").first_or_create
    rank = QuestionType.where(name: "rank").first_or_create

    # create nodes per branch, and questions for nodes, and answers for questions
    #
    # scenario questions
    # TODO: add icon names for all

    splash = Node.where(nickname: "splash", is_decision_point: false, branch_id: blue.id, template_name: "splash", skippable: false).first_or_create
      splashq = Question.where(node_id: splash.id, question: "", question_type_id: single_choice.id).first_or_create
        splashqa1 = Answer.where(question_id: splashq.id, answer: "Splash screen seen", icon_name: nil).first_or_create

    sq1 = Node.where(nickname: "zipcode", is_decision_point: false, branch_id: blue.id, template_name: "sq-1", skippable: false).first_or_create
      sq1q = Question.where(node_id: sq1.id, question: "Where in LA are you coming from?", question_type_id: single_choice.id).first_or_create
      # ^ needs a question type
        # sq1a1 = Answer.create(question_id: sq1q.id, answer: "Less than 30 minute drive away", icon_name: nil)
        # sq1a2 = Answer.create(question_id: sq1q.id, answer: "30 - 60 minutes away", icon_name: nil)
        # sq1a3 = Answer.create(question_id: sq1q.id, answer: "1 - 2 hours away", icon_name: nil)
        # sq1a4 = Answer.create(question_id: sq1q.id, answer: "2 - 4 hours away", icon_name: nil)
        # sq1a5 = Answer.create(question_id: sq1q.id, answer: "More than 4 hours away", icon_name: nil)

    sq22 = Node.where(nickname: "passengers", is_decision_point: false , branch_id: blue.id, template_name: "sq-2-2", skippable: false).first_or_create
      sq22q = Question.where(
        node_id: sq22.id,
        question: "You are the chosen one, selected to pick up XXX. There will be X passengers you need to pick up. They will have XXX with them",
        question_type_id: single_choice.id
      ).first_or_create

    #sq31 = Node.create(nickname: "SQ 3.1", is_decision_point: false , branch_id: scenario_questions_branch.id, template_name: "sq-3-3")
    #  sq31q = Question.create(
    #    node_id: sq31.id,
    #    question: "Flight Number XXX from XXX is coming and will land in X. The traffic forecast is XXX.",
    #    question_type_id: single_choice.id
    #  )

    #sq35 = Node.create(nickname: "SQ 3.5", is_decision_point: false , branch_id: scenario_questions_branch.id, template_name: "sq-3-5")
    #  sq35q = Question.create(node_id: sq35.id, question: "There is a friend in the car helping you with this pick-up ", question_type_id: single_choice.id)
      # ^ This will either say this or an alternate based on a random generation

    gq1a = Node.where(nickname: "a_whyuchoose", is_decision_point: false , branch_id: blue.id, template_name: "gq-1-a", dashboard_type: "plane").first_or_create
      gq1aq = Question.where(node_id: gq1a.id, question: "Why did you choose this strategy?", question_type_id: many_choice.id).first_or_create
        gq1aa1 = Answer.where(question_id: gq1aq.id, answer: "To make it convenient for my passenger", icon_name: nil, custom_order: 1).first_or_create
        gq1aa2 = Answer.where(question_id: gq1aq.id, answer: "Other (Explain)", icon_name: nil, custom_order: 5).first_or_create
        gq1aa3 = Answer.where(question_id: gq1aq.id, answer: "To enter/exit the airport as quickly as possible", icon_name: nil, custom_order: 2).first_or_create
        gq1aa4 = Answer.where(question_id: gq1aq.id, answer: "To avoid paying for parking", icon_name: nil, custom_order: 3).first_or_create
        gq1aa5 = Answer.where(question_id: gq1aq.id, answer: "To minimize the hassle for me", icon_name: nil, custom_order: 4).first_or_create

    gq1b = Node.where(nickname: "b_whyuchoose", is_decision_point: false , branch_id: blue.id, template_name: "gq-1-b", dashboard_type: "plane").first_or_create
      gq1bq = Question.where(node_id: gq1b.id, question: "Why did you choose this strategy?", question_type_id: many_choice.id).first_or_create
        gq1ba1 = Answer.where(question_id: gq1bq.id, answer: "To minimize the hassle for me", icon_name: nil, custom_order: 4).first_or_create
        gq1ba2 = Answer.where(question_id: gq1bq.id, answer: "To make it convenient for my passenger", icon_name: nil, custom_order: 1).first_or_create
        gq1ba3 = Answer.where(question_id: gq1bq.id, answer: "To enter/exit the airport as quickly as possible", icon_name: nil, custom_order: 2).first_or_create
        gq1ba4 = Answer.where(question_id: gq1bq.id, answer: "To avoid paying for parking", icon_name: nil, custom_order: 3).first_or_create
        gq1ba5 = Answer.where(question_id: gq1bq.id, answer: "Other (Explain)", icon_name: nil, custom_order: 5).first_or_create

    gq1c = Node.where(nickname: "c_whyuchoose", is_decision_point: false , branch_id: blue.id, template_name: "gq-1-c", dashboard_type: "plane").first_or_create
      gq1cq = Question.where(node_id: gq1c.id, question: "Why did you choose this strategy?", question_type_id: many_choice.id).first_or_create
        gq1ca1 = Answer.where(question_id: gq1cq.id, answer: "To minimize the hassle for me", icon_name: nil, custom_order: 4).first_or_create
        gq1ca2 = Answer.where(question_id: gq1cq.id, answer: "To make it convenient for my passenger", icon_name: nil, custom_order: 1).first_or_create
        gq1ca3 = Answer.where(question_id: gq1cq.id, answer: "To enter/exit the airport as quickly as possible", icon_name: nil, custom_order: 2).first_or_create
        gq1ca4 = Answer.where(question_id: gq1cq.id, answer: "To avoid paying for parking", icon_name: nil, custom_order: 3).first_or_create
        gq1ca5 = Answer.where(question_id: gq1cq.id, answer: "Other (Explain)", icon_name: nil, custom_order: 5).first_or_create

    gq1itf = Node.where(nickname: "d_whyuchoose", is_decision_point: false , branch_id: blue.id, template_name: "gq-1-itf", dashboard_type: "plane").first_or_create
      gq1itfq = Question.where(node_id: gq1itf.id, question: "Why did you choose this strategy?", question_type_id: many_choice.id).first_or_create
        gq1itfa1 = Answer.where(question_id: gq1itfq.id, answer: "To minimize the hassle for me", icon_name: nil, custom_order: 4).first_or_create
        gq1itfa2 = Answer.where(question_id: gq1itfq.id, answer: "To make it convenient for my passenger", icon_name: nil, custom_order: 1).first_or_create
        gq1itfa3 = Answer.where(question_id: gq1itfq.id, answer: "To enter/exit the airport as quickly as possible", icon_name: nil, custom_order: 2).first_or_create
        gq1itfa4 = Answer.where(question_id: gq1itfq.id, answer: "To avoid paying for parking", icon_name: nil, custom_order: 3).first_or_create
        gq1itfa5 = Answer.where(question_id: gq1itfq.id, answer: "Other (Explain)", icon_name: nil, custom_order: 5).first_or_create

    ns4 = Node.where(nickname: "itf_1stchoice", is_decision_point: false , branch_id: orange.id, template_name: "ns-4", dashboard_type: "plane", skippable: false).first_or_create
      ns4q = Question.where(node_id: ns4.id, question: "Nice! This location is part of the largest improvement project ever at LAX.\nWe'd love to hear how this project can help you and your passengers navigate LAX better", question_type_id: single_choice.id).first_or_create
        ns4qa1 = Answer.where(question_id: ns4q.id, answer: "NS 4 answer", icon_name: nil).first_or_create

    ns4noitf = Node.where(nickname: "itf_yes", is_decision_point: false , branch_id: orange.id, template_name: "ns-4-no-itf", dashboard_type: "car", skippable: false).first_or_create
      ns4noitfq = Question.where(node_id: ns4noitf.id, question: "Nice! This location is part of the largest improvement project ever at LAX.\nWe'd love to hear how this project can help you and your passengers navigate LAX better", question_type_id: single_choice.id).first_or_create
        ns4noitfqa1 = Answer.where(question_id: ns4noitfq.id, answer: "NS 4 NO ITF answer", icon_name: nil).first_or_create

    ns5noitf = Node.where(nickname: "itf_no", is_decision_point: false , branch_id: orange.id, template_name: "ns-5-no-itf", dashboard_type: "car", skippable: false).first_or_create
      ns5noitfq = Question.where(node_id: ns5noitf.id, question: "We're actually currently working on building this new location and want to make sure you find it as useful as possible. We want your input on how we should build this location.", question_type_id: single_choice.id).first_or_create
        ns5noitfqa1 = Answer.where(question_id: ns5noitfq.id, answer: "NS 5 NO ITF answer", icon_name: nil).first_or_create

    # meet offsite at train ride
    # what is this?

    itf2 = Node.where(nickname: "itf1st_pickup", is_decision_point: false , branch_id: orange.id, template_name: "itf-2", dashboard_type: "plane").first_or_create
      itf2q = Question.where(
        node_id: itf2.id,
        question: "What is most important to you when picking up somebody at LAX?",
        question_type_id: many_choice.id
      ).first_or_create
        itf2a1= Answer.where(question_id: itf2q.id, answer: "Free short-term parking", icon_name: "parking").first_or_create
        itf2a2= Answer.where(question_id: itf2q.id, answer: "A way to make sure I know the status of my passenger’s flight.", icon_name: "computer").first_or_create
        itf2a3= Answer.where(question_id: itf2q.id, answer: "A place to get food or a drink", icon_name: "food").first_or_create
        itf2a4= Answer.where(question_id: itf2q.id, answer: "Easy ways to get in and out of the location", icon_name: "exit").first_or_create
        itf2a5= Answer.where(question_id: itf2q.id, answer: "WIFi", icon_name: "wifi").first_or_create
        itf2a6= Answer.where(question_id: itf2q.id, answer: "A comfortable waiting area", icon_name: "couch").first_or_create
        itf2a7= Answer.where(question_id: itf2q.id, answer: "Wheelchair/Disabled Assistants", icon_name: "helpdesk").first_or_create
        itf2a8= Answer.where(question_id: itf2q.id, answer: "Dog run/relief area", icon_name: "dog").first_or_create
        itf2a9= Answer.where(question_id: itf2q.id, answer: "Children’s Play Area", icon_name: "family").first_or_create

    itf3 = Node.where(nickname: "itf1st_depart", is_decision_point: false , branch_id: orange.id, template_name: "itf-3", dashboard_type: "plane").first_or_create
      itf3q = Question.where(
        node_id: itf3.id,
        question: "Which of these amenities would you prioritize having? Select your top 3.",
        question_type_id: many_choice.id
      ).first_or_create
        itf3a1= Answer.where(question_id: itf3q.id, answer: "Free short-term parking", icon_name: "parking").first_or_create
        itf3a2= Answer.where(question_id: itf3q.id, answer: "A way to make sure I know the status of my flight.", icon_name: "computer").first_or_create
        itf3a3= Answer.where(question_id: itf3q.id, answer: "A place to get food or a drink", icon_name: "food").first_or_create
        itf3a4= Answer.where(question_id: itf3q.id, answer: "Easy ways to get in and out of the location", icon_name: "exit").first_or_create
        itf3a5= Answer.where(question_id: itf3q.id, answer: "WIFi", icon_name: "wifi").first_or_create
        itf3a6= Answer.where(question_id: itf3q.id, answer: "A comfortable waiting area", icon_name: "couch").first_or_create
        itf3a7= Answer.where(question_id: itf3q.id, answer: "Wheelchair/Disabled Assistants", icon_name: "helpdesk").first_or_create
        itf3a8= Answer.where(question_id: itf3q.id, answer: "Valet Parking", icon_name: "valet").first_or_create
        itf3a9= Answer.where(question_id: itf3q.id, answer: "Bag Check-in/Drop Off", icon_name: "bagcheck").first_or_create

    itf2noitf = Node.where(nickname: "itf_pickup", is_decision_point: false , branch_id: orange.id, template_name: "itf-2-no-itf", dashboard_type: "car").first_or_create
      itf2noitfq = Question.where(
        node_id: itf2noitf.id,
        question: "What is most important to you when picking up somebody at LAX?",
        question_type_id: many_choice.id
      ).first_or_create
        itf2noitfa1= Answer.where(question_id: itf2noitfq.id, answer: "Free short-term parking", icon_name: "parking").first_or_create
        itf2noitfa2= Answer.where(question_id: itf2noitfq.id, answer: "A way to make sure I know the status of my passenger’s flight.", icon_name: "computer").first_or_create
        itf2noitfa3= Answer.where(question_id: itf2noitfq.id, answer: "A place to get food or a drink", icon_name: "food").first_or_create
        itf2noitfa4= Answer.where(question_id: itf2noitfq.id, answer: "Easy ways to get in and out of the location", icon_name: "exit").first_or_create
        itf2noitfa5= Answer.where(question_id: itf2noitfq.id, answer: "WIFi", icon_name: "wifi").first_or_create
        itf2noitfa6= Answer.where(question_id: itf2noitfq.id, answer: "A comfortable waiting area", icon_name: "couch").first_or_create
        itf2noitfa7= Answer.where(question_id: itf2noitfq.id, answer: "Wheelchair/Disabled Assistants", icon_name: "helpdesk").first_or_create
        itf2noitfa8= Answer.where(question_id: itf2noitfq.id, answer: "Dog run/relief area", icon_name: "dog").first_or_create
        itf2noitfa9= Answer.where(question_id: itf2noitfq.id, answer: "Children’s Play Area", icon_name: "family").first_or_create

    itf3noitf = Node.where(nickname: "itf_depart", is_decision_point: false , branch_id: orange.id, template_name: "itf-3-no-itf", dashboard_type: "car").first_or_create
      itf3noitfq = Question.where(
        node_id: itf3noitf.id,
        question: "Which of these amenities would you prioritize having? Select your top 3.",
        question_type_id: many_choice.id
      ).first_or_create
        itf3noitfa1= Answer.where(question_id: itf3noitfq.id, answer: "Free short-term parking", icon_name: "parking").first_or_create
        itf3noitfa2= Answer.where(question_id: itf3noitfq.id, answer: "A way to make sure I know the status of my passenger’s flight.", icon_name: "computer").first_or_create
        itf3noitfa3= Answer.where(question_id: itf3noitfq.id, answer: "A place to get food or a drink", icon_name: "food").first_or_create
        itf3noitfa4= Answer.where(question_id: itf3noitfq.id, answer: "Easy ways to get in and out of the location", icon_name: "exit").first_or_create
        itf3noitfa5= Answer.where(question_id: itf3noitfq.id, answer: "WIFi", icon_name: "wifi").first_or_create
        itf3noitfa6= Answer.where(question_id: itf3noitfq.id, answer: "A comfortable waiting area", icon_name: "couch").first_or_create
        itf3noitfa7= Answer.where(question_id: itf3noitfq.id, answer: "Wheelchair/Disabled Assistants", icon_name: "helpdesk").first_or_create
        itf3noitfa8= Answer.where(question_id: itf3noitfq.id, answer: "Valet Parking", icon_name: "valet").first_or_create
        itf3noitfa9= Answer.where(question_id: itf3noitfq.id, answer: "Bag Check-in/Drop Off", icon_name: "bagcheck").first_or_create

    # wait offsite
    c1 = Node.where(nickname: "whereuwait", is_decision_point: false , branch_id: orange.id, template_name: "c-1", dashboard_type: "plane").first_or_create
      c1q = Question.where(node_id: c1.id, question: "Where do you usually wait for your passenger?", question_type_id: single_choice.id).first_or_create
        c1a1= Answer.where(question_id: c1q.id, answer: "Cellphone waiting lot", icon_name: nil).first_or_create
        c1a2= Answer.where(question_id: c1q.id, answer: "Roadside near the airport", icon_name: nil).first_or_create
        c1a3= Answer.where(question_id: c1q.id, answer: "Nearby Store", icon_name: nil).first_or_create
        c1a4= Answer.where(question_id: c1q.id, answer: "Nearby Restaurant", icon_name: nil).first_or_create

    c2 = Node.where(nickname: "expect2wait", is_decision_point: false , branch_id: orange.id, template_name: "c-2", dashboard_type: "plane").first_or_create
      c2q = Question.where(node_id: c2.id, question: "How long do you expect to wait before driving into the terminal area?", question_type_id: single_choice.id).first_or_create
        c2a1= Answer.where(question_id: c2q.id, answer: "Less than 15 minutes", icon_name: nil, custom_order: 2).first_or_create
        c2a2= Answer.where(question_id: c2q.id, answer: "15 - 30 minutes", icon_name: nil, custom_order: 4).first_or_create
        c2a3= Answer.where(question_id: c2q.id, answer: "30 - 60 minutes", icon_name: nil, custom_order: 3).first_or_create
        c2a4= Answer.where(question_id: c2q.id, answer: "More than 60 minutes", icon_name: nil, custom_order: 1).first_or_create

    c4 = Node.where(nickname: "longestwait", is_decision_point: false , branch_id: orange.id, template_name: "c-4", dashboard_type: "plane").first_or_create
      c4q = Question.where(node_id: c4.id, question: "What is the longest you are willing to wait for your passenger?", question_type_id: single_choice.id).first_or_create
        c4a1= Answer.where(question_id: c4q.id, answer: "Set duration...", icon_name: nil).first_or_create

    # park and meet
    b1 = Node.where(nickname: "whypark", is_decision_point: false , branch_id: green.id, template_name: "b-1", dashboard_type: "plane").first_or_create
      b1q = Question.where(node_id: b1.id, question: "Why do you choose to park your car?", question_type_id: many_choice.id).first_or_create
      # ^ this will need alt question text
        b1a1= Answer.where(question_id: b1q.id, answer: "Convenient parking is available", icon_name: nil, custom_order: 1).first_or_create
        b1a2= Answer.where(question_id: b1q.id, answer: "To avoid driving in traffic", icon_name: nil, custom_order: 2).first_or_create
        b1a3= Answer.where(question_id: b1q.id, answer: "To meet my passenger in the terminal", icon_name: nil, custom_order: 3).first_or_create
        b1a4= Answer.where(question_id: b1q.id, answer: "Other (Specify)", icon_name: nil, custom_order: 4).first_or_create

    b2 = Node.where(nickname: "howlongpark", is_decision_point: false , branch_id: green.id, template_name: "b-2",  dashboard_type: "plane").first_or_create
      b2q = Question.where(node_id: b2.id, question: "You need to time your parking correctly. How long are you going to park for?", question_type_id: single_choice.id).first_or_create
      # ^ this will need alt question text
        b2a1= Answer.where(question_id: b2q.id, answer: "Less than 30 minutes", icon_name: nil, custom_order: 2).first_or_create
        b2a2= Answer.where(question_id: b2q.id, answer: "30 - 60 minutes", icon_name: nil, custom_order: 4).first_or_create
        b2a3= Answer.where(question_id: b2q.id, answer: "60 - 90 minutes", icon_name: nil, custom_order: 3).first_or_create
        b2a4= Answer.where(question_id: b2q.id, answer: "More than 90 minutes", icon_name: nil, custom_order: 1).first_or_create

    b3 = Node.where(nickname: "watdoingparked", is_decision_point: false , branch_id: green.id, template_name: "b-3", dashboard_type: "plane").first_or_create
      b3q = Question.where(node_id: b3.id, question: "What are you doing while you're parked?", question_type_id: many_choice.id).first_or_create
        b3a1= Answer.where(question_id: b3q.id, answer: "Waiting in my car", icon_name: nil, custom_order: 1).first_or_create
        b3a2= Answer.where(question_id: b3q.id, answer: "Waiting in the terminal", icon_name: nil, custom_order: 2).first_or_create
        b3a3= Answer.where(question_id: b3q.id, answer: "Shopping in the terminal", icon_name: nil, custom_order: 3).first_or_create
        b3a4= Answer.where(question_id: b3q.id, answer: "Getting food or a drink in the terminal", icon_name: nil, custom_order: 4).first_or_create

    b4 = Node.where(nickname: "parkinglooktime", is_decision_point: false , branch_id: green.id, template_name: "b-4", dashboard_type: "plane").first_or_create
      b4q = Question.where(node_id: b4.id, question: "What is the longest you are willing to look for parking?", question_type_id: single_choice.id).first_or_create
        b4a1 = Answer.where(question_id: b4q.id, answer: "Set duration...", icon_name: nil).first_or_create

    # hope to catch
    a1 = Node.where(nickname: "howwellwork", is_decision_point: false , branch_id: purple.id, template_name: "a-1", dashboard_type: "plane").first_or_create
      a1q = Question.where(node_id: a1.id, question: "How well do you think this strategy will work?", question_type_id: single_choice.id).first_or_create
        a1a1 = Answer.where(question_id: a1q.id, answer: "Works like a charm every time", icon_name: nil).first_or_create
        a1a2 = Answer.where(question_id: a1q.id, answer: "I might have to circle a few times, but it will eventually work", icon_name: nil).first_or_create
        a1a3 = Answer.where(question_id: a1q.id, answer: "It's always bad, but it's better than parking", icon_name: nil).first_or_create

    a2 = Node.where(nickname: "latecheck", is_decision_point: false , branch_id: purple.id, template_name: "a-2", dashboard_type: "plane").first_or_create
      a2q = Question.where(
        node_id: a2.id,
        question: "You have a feeling your passenger will be late.\n How do you check for that?",
        question_type_id: single_choice.id
      ).first_or_create
        a2a1 = Answer.where(question_id: a2q.id, answer: "Check mobile phone for flight information", icon_name: nil).first_or_create
        a2a2 = Answer.where(question_id: a2q.id, answer: "Try to reach passenger", icon_name: nil).first_or_create
        a2a3 = Answer.where(question_id: a2q.id, answer: "Park and go inside terminal", icon_name: nil).first_or_create


    # ending questions
    # success via A/B/C branch win
    e1 = Node.where(nickname: "success1", is_decision_point: false , branch_id: blue.id, template_name: "e-1", skippable: false).first_or_create
      e1q = Question.where(node_id: e1.id, question: "Passenger Pick Up Success!", question_type_id: single_choice.id).first_or_create
        e1a1 = Answer.where(question_id: e1q.id, answer: "Next", icon_name: nil).first_or_create

    # success via choice to go to an offsite tram
    e1itf = Node.where(nickname: "success2", is_decision_point: false , branch_id: blue.id, template_name: "e-1-itf", skippable: false).first_or_create
      e1itfq = Question.where(node_id: e1itf.id, question: "Passenger Pick Up Success!", question_type_id: single_choice.id).first_or_create
        e1itfa1 = Answer.where(question_id: e1itfq.id, answer: "Next", icon_name: nil).first_or_create

    e2 = Node.where(nickname: "times_circled", is_decision_point: false , branch_id: blue.id, template_name: "e-2", dashboard_type: "car").first_or_create
      e2q = Question.where(
        node_id: e2.id,
        question: "Based on this scenario, we estimated you have circled around the terminal [X] times before picking up your passenger.\nIs this typical?",
        question_type_id: single_choice.id
      ).first_or_create
        e2a1 = Answer.where(question_id: e2q.id, answer: "Yes", icon_name: nil).first_or_create
        e2a2 = Answer.where(question_id: e2q.id, answer: "No", icon_name: nil).first_or_create

    e3 = Node.where(nickname: "time_spent", is_decision_point: false , branch_id: blue.id, template_name: "e-3", dashboard_type: "car").first_or_create
      e3q = Question.where(
        node_id: e3.id,
        question: "Based on this game, we estimated you spent [Calculated Game Time in Minutes] getting your passenger at the airport.\nIs this typical?",
        question_type_id: single_choice.id
      ).first_or_create
        e3a1 = Answer.where(question_id: e3q.id, answer: "Yes", icon_name: nil).first_or_create
        e3a2 = Answer.where(question_id: e3q.id, answer: "No", icon_name: nil).first_or_create

    e4 = Node.where(nickname: "LAX_reason", is_decision_point: false , branch_id: blue.id, template_name: "e-4", dashboard_type: "car", skippable: false).first_or_create
      e4q = Question.where(
        node_id: e4.id,
        question: "What was the reason for your last trip to LAX?",
        question_type_id: single_choice.id
      ).first_or_create
        e4a1 = Answer.where(question_id: e4q.id, answer: "Business or business-related travel", icon_name: nil).first_or_create
        e4a2 = Answer.where(question_id: e4q.id, answer: "Leisure/vacation/visiting", icon_name: nil).first_or_create
        e4a3 = Answer.where(question_id: e4q.id, answer: "Not travelling: Picking-up passenger", icon_name: nil).first_or_create
        e4a4 = Answer.where(question_id: e4q.id, answer: "Not travelling: Dropping-off passenger", icon_name: nil).first_or_create
        e4a5 = Answer.where(question_id: e4q.id, answer: "Another reason (Specify)", icon_name: nil).first_or_create

    e5 = Node.where(nickname: "LAX_howoften", is_decision_point: false , branch_id: blue.id, template_name: "e-5", dashboard_type: "car", skippable: false).first_or_create
      e5q = Question.where(
        node_id: e5.id,
        question: "About how often do you go to LAX?",
        question_type_id: single_choice.id
      ).first_or_create
        e5a1 = Answer.where(question_id: e5q.id, answer: "Less than once a year", icon_name: nil).first_or_create
        e5a2 = Answer.where(question_id: e5q.id, answer: "1 - 2 times a year", icon_name: nil).first_or_create
        e5a3 = Answer.where(question_id: e5q.id, answer: "3 - 6 times a year", icon_name: nil).first_or_create
        e5a4 = Answer.where(question_id: e5q.id, answer: "6 - 9 times a year", icon_name: nil).first_or_create
        e5a5 = Answer.where(question_id: e5q.id, answer: "More than 9 times a year", icon_name: nil).first_or_create

    e6 = Node.where(nickname: "how_old", is_decision_point: false , branch_id: blue.id, template_name: "e-6", dashboard_type: "car", skippable: false).first_or_create
      e6q = Question.where(
        node_id: e6.id,
        question: "And finally, my esteemed driver: How old are you?",
        question_type_id: single_choice.id
      ).first_or_create
        e6a1 = Answer.where(question_id: e6q.id, answer: "18 - 24", icon_name: nil).first_or_create
        e6a2 = Answer.where(question_id: e6q.id, answer: "25 - 34", icon_name: nil).first_or_create
        e6a3 = Answer.where(question_id: e6q.id, answer: "35 - 44", icon_name: nil).first_or_create
        e6a4 = Answer.where(question_id: e6q.id, answer: "45 - 54", icon_name: nil).first_or_create
        e6a5 = Answer.where(question_id: e6q.id, answer: "55 - 64", icon_name: nil).first_or_create
        e6a6 = Answer.where(question_id: e6q.id, answer: "65 - 74", icon_name: nil).first_or_create
        e6a7 = Answer.where(question_id: e6q.id, answer: "75+", icon_name: nil).first_or_create

    e7 = Node.where(nickname: "congrats", is_decision_point: false , branch_id: blue.id, template_name: "e-7", skippable: false).first_or_create
      e7q = Question.where(
        node_id: e7.id,
        question: "You made it home!\nThank you for playing. All this information will help LAX better serve you in the future. If you want to keep in touch with our progress towards the new location please join our mailing list or visit us at http://connectinglax.com",
        question_type_id: single_choice.id
      ).first_or_create
        e7a1 = Answer.where(question_id: e7q.id, answer: "Email Input", icon_name: nil).first_or_create

    # where does this go/branch name?
    # itf1 = Node.create(nickname: "ITF 1", is_decision_point: false , branch_id: ending_questions_branch.id)

    # Decision Points
    noitf1 = Node.where(nickname: "itf_yes_no", is_decision_point: true , branch_id: orange.id, template_name: "no-itf-1", dashboard_type: "car", skippable: false).first_or_create
      noitf1dp = DecisionPoint.where(
        node_id: noitf1.id,
        situation: "To avoid all of this, we're trying to build an airport rail system that would make it easy for a passenger to meet you at a nearby location outside of the airport! \nIn the real world, would you consider picking up passengers at this new location for a better experience?"
      ).first_or_create
        noitf1d1 = Decision.where(decision_point_id: noitf1dp.id, decision: "Yes", destination_node_id: ns4noitf.id).first_or_create
        noitf1d2 = Decision.where(decision_point_id: noitf1dp.id, decision: "No", destination_node_id: ns5noitf.id).first_or_create

    dp1 = Node.where(nickname: "strategy", is_decision_point: true , branch_id: blue.id, template_name: "dp-1", dashboard_type: "plane", skippable: false).first_or_create
      dp1dp = DecisionPoint.where(node_id: dp1.id, situation: "What is your strategy for picking up your passenger at LAX?").first_or_create
        dp1d1 = Decision.where(decision_point_id: dp1dp.id, decision: "Park and meet your passenger inside the terminal", destination_node_id: gq1b.id).first_or_create
        dp1d2 = Decision.where(decision_point_id: dp1dp.id, decision: "Circle and catch your passenger at the curb", destination_node_id: gq1a.id).first_or_create
        dp1d3 = Decision.where(decision_point_id: dp1dp.id, decision: "Wait off site until passenger is ready to be picked up at the curb", destination_node_id: gq1c.id).first_or_create
        dp1d4 = Decision.where(decision_point_id: dp1dp.id, decision: "Meet at a new facility that has a 10 min connecting tram to the terminals", destination_node_id: gq1itf.id).first_or_create
        dp1d5 = Decision.where(decision_point_id: dp1dp.id, decision: "Default view", destination_node_id: b1.id).first_or_create

    # TODO: will be removed!
    dp8 = Node.where(nickname: "cant_reach", is_decision_point: true , branch_id: orange.id, template_name: "dp-8", dashboard_type: "plane", skippable: false).first_or_create
      dp8dp = DecisionPoint.where(node_id: dp8.id, situation: "Your pick-up isn't calling and you can't reach them. What do you do now?").first_or_create
        dp8d1 = Decision.where(decision_point_id: dp8dp.id, decision: "Go park in the terminal parking area", destination_node_id: b1.id).first_or_create
        dp8d2 = Decision.where(decision_point_id: dp8dp.id, decision: "Circle and catch your passenger at the curb", destination_node_id: a1.id).first_or_create
        dp8d3 = Decision.where(decision_point_id: dp8dp.id, decision: "Keep waiting", destination_node_id: c4.id).first_or_create
        dp8d4 = Decision.where(decision_point_id: dp8dp.id, decision: "Meet at a new facility that has a 10 min connecting tram to the terminals", destination_node_id: ns4.id).first_or_create

    # spinner
    dp7 = Node.where(nickname: "park_howlong", is_decision_point: true , branch_id: orange.id, template_name: "dp-7", dashboard_type: "plane", skippable: false).first_or_create
      dp7dp = DecisionPoint.where(node_id: dp7.id, situation: "Okay now you're parked. How long will you wait for?").first_or_create
        dp7d1 = Decision.where(decision_point_id: dp7dp.id, decision: "5 Minutes", destination_node_id: e1.id).first_or_create
        dp7d2 = Decision.where(decision_point_id: dp7dp.id, decision: "An eternity", destination_node_id: e1.id).first_or_create

    # TODO: remove
    dp7a = Node.where(nickname: "late_passenger", is_decision_point: true , branch_id: orange.id, template_name: "dp-7a", dashboard_type: "plane", skippable: false).first_or_create
      dp7adp = DecisionPoint.where(node_id: dp7a.id, situation: "Is the passenger late?").first_or_create
        dp7ad1 = Decision.where(decision_point_id: dp7adp.id, decision: "Yes", destination_node_id: dp7.id).first_or_create
        dp7ad2 = Decision.where(decision_point_id: dp7adp.id, decision: "No", destination_node_id: noitf1.id).first_or_create

    ## start weird intertwined DPs
    dp11 = Node.where(nickname: "park_looking", is_decision_point: true , branch_id: green.id, template_name: "dp-11", dashboard_type: "plane", skippable: false).first_or_create
    # spinner
    dp10 = Node.where(nickname: "find_park", is_decision_point: true , branch_id: green.id, template_name: "dp-10", dashboard_type: "plane", skippable: false).first_or_create
    dp6 = Node.where(nickname: "no_park_gps", is_decision_point: true , branch_id: green.id, template_name: "dp-6", dashboard_type: "plane", skippable: false).first_or_create

      dp11dp = DecisionPoint.where(node_id: dp11.id, situation: "You've been looking for XX minutes with no luck. What now?").first_or_create
        dp11d1 = Decision.where(decision_point_id: dp11dp.id, decision: "Keep trying", destination_node_id: dp10.id).first_or_create
        dp11d2 = Decision.where(decision_point_id: dp11dp.id, decision: "Give up", destination_node_id: dp6.id).first_or_create

      # spinner
      dp10dp = DecisionPoint.where(node_id: dp10.id, situation: "Do you find parking?").first_or_create
        dp10d1 = Decision.where(decision_point_id: dp10dp.id, decision: "Yes", destination_node_id: b4.id).first_or_create
        dp10d2 = Decision.where(decision_point_id: dp10dp.id, decision: "No", destination_node_id: dp11.id).first_or_create

      dp6dp = DecisionPoint.where(node_id: dp6.id, situation: "There is no parking anywhere! Where to now?").first_or_create
        dp6d1 = Decision.where(decision_point_id: dp6dp.id, decision: "Go to another parking structure", destination_node_id: dp10.id).first_or_create
        dp6d2 = Decision.where(decision_point_id: dp6dp.id, decision: "Circle and catch your passenger at the curb", destination_node_id: a1.id).first_or_create
        dp6d3 = Decision.where(decision_point_id: dp6dp.id, decision: "Leave and wait off site until passenger is ready to be picked up at the curb", destination_node_id: c1.id).first_or_create
        dp6d4 = Decision.where(decision_point_id: dp6dp.id, decision: "Meet at a new facility that has a 10 min connecting tram to the terminals", destination_node_id: ns4.id).first_or_create
    ## end weird intertwined DPs

    # spinner
    dp5 = Node.where(nickname: "park_full", is_decision_point: true , branch_id: green.id, template_name: "dp-5", dashboard_type: "plane", skippable: false).first_or_create
      dp5dp = DecisionPoint.where(node_id: dp5.id, situation: "You arrive at the parking garage and find...").first_or_create
        dp5d1 = Decision.where(decision_point_id: dp5dp.id, decision: "Not Full", destination_node_id: b4.id).first_or_create
        dp5d2 = Decision.where(decision_point_id: dp5dp.id, decision: "Full", destination_node_id: dp6.id).first_or_create

    dp3 = Node.where(nickname: "no_circle_gps", is_decision_point: true , branch_id: purple.id, template_name: "dp-3", dashboard_type: "plane", skippable: false).first_or_create
      dp3dp = DecisionPoint.where(node_id: dp3.id, situation: "That didn't work.  Where to now?").first_or_create
        dp3d1 = Decision.where(decision_point_id: dp3dp.id, decision: "Park and meet your passenger inside the terminal", destination_node_id: b1.id).first_or_create
        dp3d2 = Decision.where(decision_point_id: dp3dp.id, decision: "Continue circling around terminal").first_or_create # destination for this relies on dp2 below
        dp3d3 = Decision.where(decision_point_id: dp3dp.id, decision: "Leave and wait off site until passenger is ready to be picked up at the curb", destination_node_id: c1.id).first_or_create
        dp3d4 = Decision.where(decision_point_id: dp3dp.id, decision: "Meet at a new facility that has a 10 min connecting tram to the terminals", destination_node_id: ns4.id).first_or_create

    # spinner
    dp2 = Node.where(nickname: "circle_win", is_decision_point: true , branch_id: purple.id, template_name: "dp-2", dashboard_type: "plane", skippable: false).first_or_create
      dp2dp = DecisionPoint.where(node_id: dp2.id, situation: "You're trying to pull-over and pick up your passenger in traffic. Are you successful?").first_or_create
        dp2d1 = Decision.where(decision_point_id: dp2dp.id, decision: "Yes", destination_node_id: e1.id).first_or_create
        dp2d2 = Decision.where(decision_point_id: dp2dp.id, decision: "No", destination_node_id: dp3.id).first_or_create
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
    c2.update(next_node_id: c4.id) # chopping out NO branch of DP7
    c4.update(next_node_id: dp7.id)
    #c2.update(next_node_id: dp7.id) <-- old map.
    #c4.update(next_node_id: e1.id)
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
