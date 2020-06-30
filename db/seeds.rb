Supplier.create!([
  {name: "Great Products Co", email: "gr8products@gmail.com", phone_number: "888-1234"},
  {name: "Green Thumb Gardening", email: "greenthumb@gmail.com", phone_number: "111-3872"},
  {name: "Best Buy", email: "bestbuy@gmail.com", phone_number: "999-8134"}
])
Product.create!([
  {name: "Laptop cover", price: "20.0", description: "Make your MacBook look cool and stylish while protecting it from scratches", in_stock: true, supplier_id: 2},
  {name: "Wooden laptop cover", price: "25.0", description: "Same great cover, now with wood grain!", in_stock: true, supplier_id: 1},
  {name: "Amazon Essentials Men's 9\" Inseam Woven Stretch Training Short", price: "16.0", description: "Train in confidence with this lightweight shorts made with quick-dry, moisture-wicking fabric. Loose fit is designed for all day comfort and full range of motion, features back zipper pocket, jersey waistband, functional stretch knit gusest panel for mobility, reflective logo hit.", in_stock: true, supplier_id: 2},
  {name: "MacBook Pro", price: "1200.0", description: "Shiny new laptop", in_stock: true, supplier_id: 2},
  {name: "20-20-20 All Purpose Fertilizer", price: "9.0", description: "It feeds both through the roots and the leaves. This formula of nitrogen, phosphorus and potassium provides fast green-up and rapid leaf expansion.", in_stock: true, supplier_id: 2},
  {name: "iPhone 15", price: "10000.0", description: "The latest one!", in_stock: true, supplier_id: 1},
  {name: "18 pc Animal Cable Protector", price: "15.0", description: "USB cable protecters, 18 different styles contain insect, fish, fruit and dinosaur.", in_stock: true, supplier_id: 3},
  {name: "Dual Headphone Adapter!", price: "9.0", description: "SPLIT AUDIO: Listen to 1 portable device from 2 stereo headphones or speakers with this 3.5 mm male to dual 3.5 mm female audio splitter – each split output is ‘stereo’.", in_stock: true, supplier_id: 1}
])
User.create!([
  {name: "Colin", email: "colin@gmail.com", password_digest: "$2a$12$6JEj7Ofxma3W7Zk.F/s.Duet9e8Hy4sGcwAMBQ0t1Yo8sq//k3kY.", admin: false},
  {name: "Colin", email: "colin@gmail.comm", password_digest: "$2a$12$1TPx404Ec/aA9b16UMDz.uMTGOG4RkPmFx20BWhnWyvueWUY3.9wS", admin: false},
  {name: "Colin", email: "colin@gmail.co", password_digest: "$2a$12$EPD3ry1Dl1IsauLSZqoi.u.rY4V1HUT9HOFCz3bN29vjvhz/DMNyy", admin: false},
  {name: "Cheddar", email: "cheds@gmail.com", password_digest: "$2a$12$5uvJljW8JyMLO542m12zQeT20JzNElHzZ5HVZ7.UmplegF9mYyME.", admin: true}
])
CartedProduct.create!([
  {user_id: 4, product_id: 1, quantity: 3, status: "purchased", order_id: nil},
  {user_id: 4, product_id: 1, quantity: 3, status: "purchased", order_id: nil},
  {user_id: 4, product_id: 1, quantity: 3, status: "purchased", order_id: nil},
  {user_id: 4, product_id: 1, quantity: 3, status: "purchased", order_id: nil},
  {user_id: 4, product_id: 1, quantity: 1, status: "purchased", order_id: nil},
  {user_id: 4, product_id: 1, quantity: 1, status: "purchased", order_id: 29},
  {user_id: 4, product_id: 1, quantity: 1, status: "purchased", order_id: 30},
  {user_id: 4, product_id: 1, quantity: 1, status: "removed", order_id: nil},
  {user_id: 4, product_id: 1, quantity: 1, status: "removed", order_id: nil},
  {user_id: 4, product_id: 1, quantity: 1, status: "purchased", order_id: 32},
  {user_id: 4, product_id: 3, quantity: 1, status: "purchased", order_id: 33},
  {user_id: 4, product_id: 1, quantity: 1, status: "purchased", order_id: 33},
  {user_id: 4, product_id: 1, quantity: 3, status: "purchased", order_id: 34},
  {user_id: 1, product_id: 1, quantity: 1, status: "purchased", order_id: 35},
  {user_id: 1, product_id: 5, quantity: 3, status: "purchased", order_id: 35}
])
Category.create!([
  {name: "Electronics"},
  {name: "Clothing"},
  {name: "Housewares"},
  {name: "Mobile accessories"}
])
Image.create!([
  {url: "https://images-na.ssl-images-amazon.com/images/I/51doqNM-bgL._AC_SL1024_.jpg", product_id: 1},
  {url: "https://images-na.ssl-images-amazon.com/images/I/91aXFP96fIL._AC_SL1500_.jpg", product_id: 2},
  {url: "https://images-na.ssl-images-amazon.com/images/I/61EV6PDlusL._AC_SL1500_.jpg", product_id: 3},
  {url: "https://m.media-amazon.com/images/S/aplus-media/sota/c451e424-ee39-4e68-b8f9-2202bb83971b.__CR0,0,1464,600_PT0_SX1464_V1___.jpg", product_id: 4},
  {url: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp16touch-space-select-201911?wid=892&hei=820&&qlt=80&.v=1572825197207", product_id: 5},
  {url: "https://i2.wp.com/ceklog.kindel.com/wp-content/uploads/2013/02/firefox_2018-07-10_07-50-11.png", product_id: 7},
  {url: "https://i.pcmag.com/imagery/reviews/038Dr5TVEpwIv8rCljx6UcF-14..v_1588802180.jpg", product_id: 5},
  {url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaXquU2RGdTBbLQWSirfnGQDHPcl4eSWA0KG34joRokl1B8U20l_MWVAw-WStvu80SiI_ZqQY&usqp=CAc", product_id: 1},
  {url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaXquU2RGdTBbLQWSirfnGQDHPcl4eSWA0KG34joRokl1B8U20l_MWVAw-WStvu80SiI_ZqQY&usqp=CAc", product_id: 1},
  {url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaXquU2RGdTBbLQWSirfnGQDHPcl4eSWA0KG34joRokl1B8U20l_MWVAw-WStvu80SiI_ZqQY&usqp=CAc", product_id: 1},
  {url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaXquU2RGdTBbLQWSirfnGQDHPcl4eSWA0KG34joRokl1B8U20l_MWVAw-WStvu80SiI_ZqQY&usqp=CAc", product_id: 1},
  {url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaXquU2RGdTBbLQWSirfnGQDHPcl4eSWA0KG34joRokl1B8U20l_MWVAw-WStvu80SiI_ZqQY&usqp=CAc", product_id: 1},
  {url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaXquU2RGdTBbLQWSirfnGQDHPcl4eSWA0KG34joRokl1B8U20l_MWVAw-WStvu80SiI_ZqQY&usqp=CAc", product_id: 1}
])
Order.create!([
  {user_id: 1, subtotal: "10.0", tax: "0.9", total: "10.9"},
  {user_id: 3, subtotal: "60.0", tax: "5.4", total: "65.4"},
  {user_id: 3, subtotal: "27.0", tax: "2.43", total: "29.43"},
  {user_id: 1, subtotal: "45.0", tax: "4.05", total: "49.05"},
  {user_id: 3, subtotal: "27.0", tax: "2.43", total: "29.43"},
  {user_id: 3, subtotal: "27.0", tax: "2.43", total: "29.43"},
  {user_id: 3, subtotal: "27.0", tax: "2.43", total: "29.43"},
  {user_id: 3, subtotal: "27.0", tax: "2.43", total: "29.43"},
  {user_id: 4, subtotal: "3600.0", tax: "324.0", total: "3924.0"},
  {user_id: 3, subtotal: "27.0", tax: "2.43", total: "29.43"},
  {user_id: 3, subtotal: "27.0", tax: "2.43", total: "29.43"},
  {user_id: 4, subtotal: "108.0", tax: "9.72", total: "117.72"},
  {user_id: 4, subtotal: "108.0", tax: "9.72", total: "117.72"},
  {user_id: 4, subtotal: "108.0", tax: "9.72", total: "117.72"},
  {user_id: 4, subtotal: "108.0", tax: "9.72", total: "117.72"},
  {user_id: 4, subtotal: "108.0", tax: "9.72", total: "117.72"},
  {user_id: 4, subtotal: "108.0", tax: "9.72", total: "117.72"},
  {user_id: 4, subtotal: "108.0", tax: "9.72", total: "117.72"},
  {user_id: 4, subtotal: "0.0", tax: "0.0", total: "0.0"},
  {user_id: 4, subtotal: "0.0", tax: "0.0", total: "0.0"},
  {user_id: 4, subtotal: "0.0", tax: "0.0", total: "0.0"},
  {user_id: 4, subtotal: "9.0", tax: "0.81", total: "9.81"},
  {user_id: 4, subtotal: "9.0", tax: "0.81", total: "9.81"},
  {user_id: 4, subtotal: "9.0", tax: "0.81", total: "9.81"},
  {user_id: 4, subtotal: "0.0", tax: "0.0", total: "0.0"},
  {user_id: 4, subtotal: "9.0", tax: "0.81", total: "9.81"},
  {user_id: 4, subtotal: "24.0", tax: "2.16", total: "26.16"},
  {user_id: 4, subtotal: "27.0", tax: "2.43", total: "29.43"},
  {user_id: 1, subtotal: "3609.0", tax: "324.81", total: "3933.81"}
])
ProductCategory.create!([
  {product_id: 1, category_id: 1},
  {product_id: 1, category_id: 4},
  {product_id: 2, category_id: 3},
  {product_id: 3, category_id: 1},
  {product_id: 3, category_id: 4},
  {product_id: 4, category_id: 2},
  {product_id: 5, category_id: 1},
  {product_id: 7, category_id: 3}
])
