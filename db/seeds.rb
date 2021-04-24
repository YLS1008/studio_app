trainee_seed = [
    [email: "‫sherookabo95@gmail.com‬", first: "שורוק", last: "אבוריש", phone: "0523142106" ],
    [email: "test001@test.com", first: "חנה", last: "בן", phone: "0522827231" ],
    [email: "test002@test.com", first: "דבורה", last: "בר נתן", phone: "0549142190" ],
    [email: "srebecca9@gmail.com", first: "רבקה", last: "שקולניק", phone: "0544942554" ],
    [email: "rachelnaaman42@gmail.com", first: "רחל לאה", last: "נאמן", phone: "0586272538" ],
    [email: "patelharrar@yahoo.fr", first: "פטריסיה", last: "אלחרר", phone: "0544327031" ],
    [email: "gefen330@gmail.com", first: "גפן", last: "מילר", phone: "0524652051" ],
    [email: "shaked1286@gmail.com", first: "שקד", last: "גולן בלמי", phone: "0545559951" ],
    [email: "sabbah.annie@gmail.com", first: "אני", last: "סבח", phone: "0528398400" ],
    [email: "hadasco10@gmail.com", first: "הדס", last: "יואלי", phone: "0509587772" ],
    [email: "giliharis@gmail.com", first: "גילי", last: "בירמן", phone: "0544731596" ],
    [email: "nogalevy77@gmail.com", first: "נגה", last: "לוי", phone: "0528887953" ],
    [email: "noga1w@gmail.com", first: "נוגה", last: "אקוני", phone: "0509222149" ],
    [email: "uv2211@gmail.com", first: "יובל", last: "רייס", phone: "0533411428" ],
    [email: "shmulik17271@gmail.com", first: "רינה", last: "בן אהרון", phone: "0526698247" ],
    [email: "gililiberman.law@gmail.com", first: "גילי", last: "ליברמן פפו", phone: "0523499455" ],
    [email: "test003@test.com", first: "אורלי", last: "לזר", phone: "0544204323" ],
    [email: "dana.ddd@gmail.com", first: "דנה", last: "פרחי", phone: "0504049370" ],
    [email: "test004@test.com", first: "יובל", last: "רייס", phone: "0533411428" ],
    [email: "test005@test.com", first: "עמית", last: "פרשר", phone: "0524528927" ],
    [email: "appelmich@gmail.com‬", first: "מיכל", last: "אפל", phone: "0545218181" ],
    [email: "sivankatan@gmail.com‬", first: "סיוון", last: "קטן", phone: "0523990387" ],
    [email: "test006@test.com", first: "אילנה", last: "בורגסדורף", phone: "0545745299" ],
    [email: "test007@test.com", first: "מורן", last: "טננבאום", phone: "0544258402" ],
    [email: "test008@test.com", first: "ורד", last: "קרף", phone: "0504782164" ],
    [email: "ksenia.sider@gmail.com‬", first: "קסניה", last: "סידר", phone: "0525953231" ] 
]

trainee_seed.each do |seed|
    Trainee.create(seed)
end
