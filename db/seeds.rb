Category.create!([
  {name: "Humans"},
  {name: "Other Animals"},
  {name: "Foods"},
  {name: "Copyrighted Materials"},
  {name: "Plants"}
])

Pledge.create!([
  {pledger_id: 1, project_id: 2, amt: 5000.0},
  {pledger_id: 1, project_id: 1, amt: 300.0}
])

Project.create!([
  {starter_id: 2, title: "Clone Kim Jong-Un", fund_goal: 2000000.0, description: "I am Kim Jong-Un, North Korea's dear leader. I will not live forever, but I am the only person who can lead North Korea's people. I must be eternalized in order to save them from the inevitable tragedy of my death.", end_date: "2015-06-18", summary: "Please help me eternalize myself for the North Korean people. I am the only person who can lead them.", city: "Pyongyang, North Korea", pledge_total: 300.0, pct_funded: 0.0, category_id: 1, main_image_url: "http://i.imgur.com/MQ0oCKc.jpg", secondary_image_url: "http://i.telegraph.co.uk/multimedia/archive/02701/kim_2701423b.jpg"},
  {starter_id: 1, title: "Clone Dolly the Sheep (Again)", fund_goal: 600000.0, description: "For the sake of tradition and Scottish pride, we would like to clone Dolly the sheep again. The 20th anniversary of Dolly's birth is approaching. Please help us honor her legacy.", end_date: "2015-07-01", summary: "For the sake of tradition and Scottish pride, we would like to clone Dolly the sheep--again.", city: "Edinburgh, Scotland", pledge_total: 5000.0, pct_funded: 0.8, category_id: 2, main_image_url: "http://www.nature.com/scitable/content/32971/10.1038_421776a-f2_full.jpg", secondary_image_url: nil},
  {starter_id: 3, title: "Clone MEEEEEE!!!", fund_goal: 2000000.0, description: "Everyone knows I'm the sexiest woman on Earth. Please help me clone myself so that the world can have multiple copies of me. I'm so special and in demand that it's hard to make time for all the photoshoots I'm in. I'll contribute some of the funds, but I'm bringing this project to CloneStarter because I want there to be as many of me as possible.", end_date: "2015-06-14", summary: "Everyone knows I'm the sexiest woman on Earth. Please help me clone myself so that people can finally get enough of me.", city: "Los Angeles, CA", pledge_total: 0.0, pct_funded: 0.0, category_id: 1, main_image_url: "http://iadorebeauty.com/wp-content/uploads/2014/09/Kim-Kardashian-Nipples-4kimkardashiantackledbyfan.jpg", secondary_image_url: nil},
  {starter_id: 4, title: "Clone this Steak", fund_goal: 5000000.0, description: "Raising cattle is energy and pollution-intensive. At Cloned Foods Inc, we've recently patented a method of cloning only the parts of the cow that people like to eat. We're able to produce the best parts of a cow in a laboratory, at much lower energy consumption levels per kcal of meat than conventional farm-raised beef.", end_date: "2015-06-30", summary: "At Cloned Foods Inc, we've recently patented a method of cloning only the parts of the cow that people like to eat.", city: "Houston, TX", pledge_total: 0.0, pct_funded: 0.0, category_id: 3, main_image_url: "http://m.alwecdn.net/wp-content/uploads/2008/01/aragawa-rare-kobe.jpg", secondary_image_url: nil}
])

Reward.create!([
  {project_id: 2, summary: "For a contribution of $10000 or more, we will give you a wool coat from Dolly's clone's fur.", est_delivery: "2015-12-21", min_amt: 10000.0},
  {project_id: 4, summary: "We'll give you two 10-ounce top sirloin steaks.", est_delivery: "2015-05-08", min_amt: 100.0}
])

User.create!([
  {username: "iwilmut", email: "iwilmut@ed.ac.uk", password_digest: "$2a$10$rzMwBs26bLImCs3oyp./iejliT7EfrzamslWv4nvqEnoid2QG620q", session_token: "sxaC_rPFf5EcZp5yvbS17w", bio: nil},
  {username: "kimjongun", email: "leader@northkorea.nk", password_digest: "$2a$10$fM6D5Le4CMgB94WdbZYsfO1G1D.eZS0/QerezRoaRuCM3CR2Vimsy", session_token: "TQn36mzO5mQmhsYfiMDu1Q", bio: nil },
  {username: "kkitsme", email: "imthesexiest@comcast.net", password_digest: "$2a$10$QMIrflP.zLhA624lsSJCOeausdkee/OKFVAE2J/opJc40laApb5Se", session_token: "ATAHR6gDFj06-xDlAqExzg", bio: nil },
  {username: "clonedfoodsinc", email: "admin@clonedfoodsinc.com", password_digest: "$2a$10$zdm1H6jXNyOQ.HhibWCJV./ZnyzZoDmjyvHRilCFajWnWNO808mdu", session_token: "68LUCDukYVYfwS8KT8SMAQ", bio: nil },
  {username: "Guest", email: "guest@example.com", password_digest: "$2a$10$oWyzye4R/ZWDtX/VCcxu3Ok6TRpzY0QCcp50zY2Bw3n4Jtb66mjhy", session_token: "zE3w9jdzyNjkeOcLpfNR4A", bio: nil }
])
