create table Category(
cid int primary key,
cname nvarchar(30)
)

insert into Category(cid, cname)
values 
(1, 'T-SHIRT'),
(2, 'JEANS'),
(3, 'SHORT'),
(4, 'PANTS')


create table product
(
[id] int identity(1,1) primary key,
[name] nvarchar(60) UNIQUE NULL,
[original_price] money NULL,
[sale_price] money NULL,
quantity int,
[describe] nvarchar(1000) NULL,
[image] nvarchar(100) NULL,
cid int
FOREIGN KEY (cid) REFERENCES Category(cid)
)

insert into product([name],[original_price],[sale_price],quantity,describe,[image],cid)
values 
 ('$MAKER THINGS TEE IN WHITE',600000.000,500000.00,20,N'Unisex,Oversize,100% Cotton,In nổi,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9477-1710.jpg',1),
 ('I GOT HOMIES IN SAUDI TEE IN BLACK',500000.000,400000.00,14,N'Unisex,Oversize,100% Cotton,In nổi,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9495-2979.jpg',1),
 ('I GOT MONEY IN SAUDI TEE IN WHITE',500000.000,400000.00,11,N'Unisex,Oversize,100% Cotton,In nổi,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9491-3408.jpg',1),
 ('YACHT CLUB TANK TOP IN DARK PURPLE',600000.000,500000.00,10,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9521-6368.jpg',1),
 ('YACHT CLUB TEE IN BROWN',600000.000,500000.00,12,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9514-4152.jpg',1),
 ('MONEY ON MY MIND TEE IN BLACK',550000.000,450000.00,13,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9444-8531.jpg',1),
 ('EMBOSSED LOGOS STRAIGHT JEANS',950000.000,850000.00,17,N'Unisex,Straigh form,Denim,Model wears size 32','https://smakerclothing.com/upload/sanpham/dsc02893-4369.jpg',2),
 ('BORN BROKE DIE RICH MESH SHORT IN CREAM',650000.000,550000.00,15,N'Unisex,100% Mesh,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9407-4077.jpg',3),
 ('STRIPES KHAKI PANTS IN BROWN',800000.000,700000.00,18,N'Unisex,Straight Fit,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf8299-9001.jpg',4),
 ('$MAKER STRAIGHT JEANS IN BLUE',800000.000,700000.000,12,N'Unisex,Straigh form,Denim,Model wears size 32','https://smakerclothing.com/upload/sanpham/dscf8683-0961.jpg',2),
 ('LOGO STRAIGHT JEANS IN LIGHT BLUE',850000.000,750000.000,14,N'Unisex,Straigh form,Denim,Model wears size 32','https://smakerclothing.com/upload/sanpham/dscf7049-7331.jpg',2),
 ('$MAKER SHORT ON FIRE IN BLACK',700000.000,600000.000,19,N'Unisex,Draper & Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc00766-4281.jpg',3),
 ('$MAKER CORDUROY SHORT IN TAN',650000.000,550000.000,13,N'Unisex,100% Mesh,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc00754-4189.jpg',3),
 ('$MAKER X SWE CARGO FLARE PANTS IN BROWN',750000.000,650000.000,11,'NUnisex,Straigh form,100% jean,Model wears size L','https://smakerclothing.com/upload/sanpham/1-(5)-1007.jpg',4),
 ('CUSTOMIZE FLARE SWEAT PANTS IN BLACK',1150000.000,1050000.000,20,N'Hand made custom (vẽ sơn bằng tay),Unisex,100% Cotton ( Nỉ ),Model wears size L','https://smakerclothing.com/upload/sanpham/img_6182-0014.jpg',4)

insert into product([name],original_price,[sale_price],quantity,describe,[image],cid)
values 
 ('NONE OF THIS MATTERS ANYMORE TEE IN CREAM',550000.000,450000.00,17,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc00138-9101.jpg',1),
  ('CHAMPION TEE IN WHITE',550000.000,450000.00,17,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc00133-0775.jpg',1),
 ('420 PICNIC TEE IN BLACK',600000.000,500000.00,15,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc00747-2973.jpg',1),
 ('MONEY IS A BAD MASTER TEE IN BLACK',550000.000,450000.00,12,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc09817-1991.jpg',1),
 ('THE LOGOS TEE IN BLACK',600000.000,500000.00,16,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc09747-4373.jpg',1),
  ('TENVOVEN MERCH MONEY ISLAND SHORTS IN CREAM',650000.000,550000.00,17,N'Unisex,100% Mesh,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc02295-8157.jpg',3),
  ('TETVOVEN MERCH MONEY ISLAND TEE IN CREAM',650000.000,550000.00,17,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc02310-9140.jpg',1)

                                     
create table Customer (
customerID int identity(1,1) primary key,
fullName varchar(45),
gender varchar(15),
phone varchar(45),
email varchar(45), 
[password] varchar(45),
[address] nvarchar(100),
avatar nvarchar(100),
)

create table [Users](
[userID] int identity(1,1) primary key,
[userName] nvarchar(60) UNIQUE,
gender nvarchar(20) ,
email nvarchar(60),
mobile nvarchar(20),
avatar nvarchar(1255),
[address] nvarchar(45),
pass nvarchar(20),
roleID int,
userStatus int,
FOREIGN KEY (roleID) REFERENCES Roles(roleID)
)

insert into Users(userName, gender, email, mobile, avatar, [address], pass, roleID)
values 
('quangtoan','male', 'saler1@gmail.com','0939152003','https://img.nimo.tv/t/1629526287189/202403131710297308141_1629526287189_avatar.png/w240_l0/img.webp?fbclid=IwAR3V7OOezTPkRufvUleMwrD8JtWuIaskpQO3m3RZImBtUY3sLkw2DpAFSkc','ha noi','123',1),
('nguyentahoang','male', 'admin@gmail.com','0969112003','null','ha noi','123',2),
('tahoang','male', 'saler2@gmail.com','0969112003','null','ha noi','123',1),
('nhatminh','male', 'marketer@gmail.com','0969102003','null','tu son','123',3),
('duongduy','male', 'salemanager@gmail.com','0969112003','null','ha noi','123',4),
('vietduy','male', 'staff@gmail.com','0902283551','null','Son Tay','123',5),
('minhnhat','male', 'saler3@gmail.com','0969112003','null','ha noi','123',1)

SELECT u.userID, u.userName, COUNT(o.orderID) AS NumOrdersWithUserID
FROM Users u
LEFT JOIN [Order] o ON u.userID = o.sellerID
WHERE u.roleID = 1
GROUP BY u.userID, u.userName

SELECT TOP 1 u.userID 
FROM Users u 
LEFT JOIN [Order] o ON u.userID = o.sellerID 
WHERE u.roleID = 1
GROUP BY u.userID 
ORDER BY COUNT(o.orderID)

select * from [Feedback]
select * from Customer
select * from [Order]
select * from [orderDetail]
select * from Users
select * from product
select * from Roles

create table Roles (
roleID int primary key,
roleName nvarchar(20)
)

insert into Roles (roleID, roleName)
values 
(1, 'Saler'),
(2, 'Admin'),
(3, 'Marketer'),
(4, 'Sale Manager'),
(5, 'Warehouse Staff')


create table Blog (
blogID int identity(1,1) primary key,
blogTitle nvarchar(100),
blogImage varchar(500),
postDate Date,
content nvarchar(3000),
author varchar(45),
[status] varchar(45),
blogCategoryID int,
FOREIGN KEY (blogCategoryID) REFERENCES Blog_Category(blogCategoryID),
)

create table Blog_Category(
blogCategoryID int primary key,
blogCategoryName varchar(70)
)

insert into Blog_Category(blogCategoryID, blogCategoryName)
values 
(1, 'Fashion Trends'),
(2, 'Mix-Match Guides'),
(3, 'Size and style guides'),
(4, 'Clothing Care')

update Blog
set blogImage = 'https://scontent.fhan19-1.fna.fbcdn.net/v/t39.30808-6/433862136_18401690944069644_2252571701641639235_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=rGK_nk2-AsAAX_WRUP7&_nc_ht=scontent.fhan19-1.fna&oh=00_AfB69RnDy_DYLfXepd4ltqF01tGvq0VpZbGSj3YDa73QTQ&oe=65FF379E'
where blogID = 2

insert into Blog(blogTitle, blogImage, postDate, content, author,[status], blogCategoryID)
values
(N'Youth trend: Fashionable Unisex T-shirts, bursting with personality', 'https://scontent.fhan19-1.fna.fbcdn.net/v/t39.30808-6/433862136_18401690944069644_2252571701641639235_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=rGK_nk2-AsAAX_WRUP7&_nc_ht=scontent.fhan19-1.fna&oh=00_AfB69RnDy_DYLfXepd4ltqF01tGvq0VpZbGSj3YDa73QTQ&oe=65FF379E','2024/1/30', 
N'Unisex là một tính từ dùng để chỉ sự những kiểu trang phục không phân biệt về giới tính, phù hợp với tất cả hai giới và khiến hai giới trông tương tự, giống nhau. Chúng được giới trẻ gọi là trang phục phi giới tính hoặc trung lập giới tính.
Phong cách này xuất hiện từ những năm 1960 (cụ thể là vào năm 1968 trên một tờ báo có tên Life) ở Mỹ, thời kỳ  khi mà những nhu cầu bộc lộ cái tôi cá nhân, cái cá tính riêng trở nên mạnh mẽ, khi quan niệm xưa cũ về sự phân biệt giới tính bị phá vỡ và mọi người khao khát sự bình quyền nam nữ.
Phong cách Unisex được biết đến là một nhánh nhỏ trong trào lưu thời trang Harajuku ở Nhật Bản.
Ban đầu, phong cách này không được tất cả mọi người đón nhận vì họ nghĩ chúng đang gây nên sự lệch lạc về giới tính khi mà nam nữ đều có thể mặc một kiểu trang phục giống nhau, không có sự khác biệt, phân biệt. Chúng dường như trở thành một cuộc chiến, một cuộc tranh cãi thời trang rầm rộ lúc bấy giờ.
Thế nhưng, sau này, khi mà quan điểm, nhận thức của xã hội về xu hướng thời trang này thay đổi, những chiếc áo thun Unisex trở nên cực kỳ phổ biến và được ưa thích bởi hầu hết giới trẻ trên toàn thế giới.
','Tran Nhat Minh','Public',1),
(N'Trending colors of fashion in 2024', 'https://scontent.fhan19-1.fna.fbcdn.net/v/t39.30808-6/432608005_432736395966653_1365554809324263245_n.jpg?stp=cp6_dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_ohc=p7Tv8CRHwnoAX_wcKgA&_nc_ht=scontent.fhan19-1.fna&oh=00_AfDzHmKwcYCR6rGjpcHuKNOjjdkQE5dppl8NTG6EYl9s3Q&oe=66008E72','2024/1/30', 
N'Năm 2024, màu hồng đào là gam màu chủ đạo. Hồng đào hướng tới sự lạc quan, ấm áp và gắn kết chặt chẽ giữa con người với nhau. Hồng đào truyền tải thông điệp tích cực và trở thành nguồn cảm hứng sáng tạo, mới mẻ.
Hồng đào là sự kết hợp giữa màu cam nhạt mềm mại và màu hồng nhẹ nhàng, tạo cảm giác tươi mới và an lành, mang chất cổ điển nhưng không kém phần hiện đại.
Đó là màu của những chiếc lông vũ mượt mà, của quả căng mọng hay những vải lụa satin thướt tha.
Hồng đào mang đến sự trẻ trung, làm nổi bật vẻ đẹp, tạo sức hút, tạo sự tự tin cho người mặc.
Hồng đào thường được liên kết với mùa xuân và mùa hè. Mang lại cảm giác mát mẻ và tươi mới, phù hợp với các xu hướng thời trang trong những thời điểm này.
Trong trang điểm, hồng đào thể hiện vẻ ngoài tươi sáng và tự nhiên. Nó mang lại cảm giác nữ tính và ấm áp cho làn da.
Màu hồng đào phù hợp với nhiều tông da khác nhau, từ da trắng cho đến da nâu, làm cho màu sắc trở thành một sự lựa chọn linh hoạt trong ngành làm đẹp.
Dù ở trong thời trang hay trang điểm, màu hồng đào đều tôn da.
','Tran Nhat Minh','Public',1),
(N'Grasp 2024 fashion trends', 'https://scontent.fhan19-1.fna.fbcdn.net/v/t39.30808-6/432588202_18400721965069644_7248504779758164581_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=FRyiSgjzRoUAX-ppwIt&_nc_ht=scontent.fhan19-1.fna&oh=00_AfB_zym65eMBRtqx2EDth3iZOZ9TJBjYxOlzF8yW5N-SRA&oe=660002E5','2024/1/30', 
N'Màu sắc và chất liệu: Trong năm 2024, dự kiến các tone màu pastel sẽ trở thành màu chủ đạo, tạo nên không khí nhẹ nhàng và tràn ngập sức sống trong thế giới thời trang. Một sự kết hợp tinh tế giữa hồng phấn, xanh và vàng nhạt có thể làm nổi bật vẻ đẹp tinh tế và thanh lịch.
Kiểu dáng và thiết kế: 2024 chân váy và váy chắc chắn trở thành điểm nhấn nổi bật, với sự xuất hiện của kiểu oversize và dáng suông. Oversize mang lại sự thoải mái và phóng khoáng, trở thành sự lựa chọn ưa thích của nhiều chị em yêu thời trang. Ngoài ra, váy dáng suông với sự nhẹ nhàng và thoải mái, đặc biệt phổ biến trong bối cảnh tìm kiếm sự thoải mái trong trang phục hàng ngày.
','Tran Nhat Minh','Public',1),
(N'Fashion: The Art of Autonomy and Outstanding Growth', 'https://scontent.fhan19-1.fna.fbcdn.net/v/t39.30808-6/431736464_18400420798069644_882877710523495006_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ERBZMEC4ABUAX81fc8S&_nc_ht=scontent.fhan19-1.fna&oh=00_AfA95dW-k5YSirDXZ8KN7CE8unxxGupYbigubUEknf7d_g&oe=6600A1C5','2024/1/16', 
N'Thời trang không chỉ là cách chúng ta ăn mặc mỗi ngày; nó là biểu tượng của cái đẹp, cái độc đáo và sự sáng tạo. Thời trang không chỉ thể hiện gu thẩm mỹ cá nhân mà còn là ngôn ngữ giao tiếp của chính bản thân chúng ta.
Ngày nay, thời trang không chỉ được tạo ra từ thế giới của các nhà thiết kế nổi tiếng mà còn bắt nguồn từ đời sống hàng ngày, nghệ thuật đương đại và sự đa dạng văn hóa. Chúng ta sẽ cùng nhau khám phá những xu hướng đang thịnh hành và cách chúng ảnh hưởng đến cộng đồng thời trang.
Nhìn xa về tương lai, chúng ta sẽ dự đoán những xu hướng sáng tạo và đa dạng trong thế giới thời trang. Cùng nhau suy nghĩ về những thách thức và cơ hội mà thời trang đang đối mặt trong thời kỳ tiếp theo.
Hãy đồng hành cùng chúng tôi trong hành trình khám phá vô tận của thế giới thời trang. Thời trang không chỉ là việc ăn mặc, mà là cách chúng ta diễn đạt bản thân và giao tiếp với thế giới xung quanh. Chúng ta là những nghệ sĩ tự do trên sân khấu lớn của cuộc sống, mỗi bộ trang phục là một tác phẩm nghệ thuật tự chủ.
','Tran Nhat Minh','Public',1),
(N'REVEALING THE PRINCIPLES OF STYLISH CLOTHING COLOR MIXING', 'https://scontent.fhan19-1.fna.fbcdn.net/v/t39.30808-6/431837716_18399610024069644_7107612313385475805_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_ohc=D26JCnVME2MAX8Q964T&_nc_ht=scontent.fhan19-1.fna&oh=00_AfD2gUGqMyRhzy-bMyWKyqmL9L4xqABPdcVaR-uTeXdghw&oe=6600151F','2024/1/16', 
N'Nguyên tắc phối màu quần áo theo bánh xe màu sắc:
1.Mix quần áo theo nguyên tắc màu sắc tương phản:
Quy tắc phối màu quần áo theo cặp màu tương phản, tức là: Bạn sẽ mix đồ theo hai màu đối diện nhau trên bánh xe màu sắc. Cặp màu tương phải giúp tạo nên một set đồ rực rỡ, nổi bật. Cách phối màu này cực kỳ phù hợp với những các bạn trẻ ưa thích màu sắc, sự tươi trẻ và nổi bật nhất trong bộ cánh của mình.
2.Mix quần áo theo nguyên tắc màu sắc liền kề:
Một lựa chọn an toàn hơn và trở nên chỉn chu trong mọi hoàn cảnh. Chính là phối màu quần áo nữ theo nguyên tắc liền kề. Tức là mix bộ đồ của bạn với 2 gam màu liền kề nhau trong bảng phối màu quần áo.
3.Phối màu quần áo đơn sắc:
Ton sur ton là cụm từ vô cùng quen thuộc đối với tín đồ thời trang thứ thiệt. Một cây quần áo kết hợp từ gam màu đơn sắc. Dù là đi theo phong cách mix màu tương phản hay liền kề đều sẽ đem lại một bộ cánh rất ổn, sành điệu, sang trọng, thanh lịch.
4.Phối màu quần áo theo gam màu trung tính:
Xám, trắng, ghi, nâu là những gam màu trung tính được yêu thích nhất trong thời trang. Bạn hãy nắm chắc nguyên tắc kết hợp 1 gam màu trung tính sáng và 1 gam màu trung tính tối trên bộ đồ của bạn. Couple TX chắc chắn bạn sẽ ngạc nhiên với vẻ đẹp sang trọng, khéo léo, lại hết sức nổi bật của chính mình.
','Tran Nhat Minh','Public',2),
(N'How to keep clothes new and durable for a long time', 'https://scontent.fhan19-1.fna.fbcdn.net/v/t39.30808-6/431036402_18398986480069644_8972115718733448747_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=biucFQgjntYAX9liD-P&_nc_ht=scontent.fhan19-1.fna&oh=00_AfCX_OXOy3Bf8asfPzLtcujfFwPZfi4IFeToge2DOsphRQ&oe=65FF4B3A', '2024/1/14', N'Làm cách nào để tẩy vết bẩn mà không làm phai quần áo?
Làm sạch vết bẩn càng nhanh càng tốt chính là cách giúp quần áo sạch đơn giản và hiệu quả nhất. Việc làm sạch nhanh sẽ giúp quần áo không bị bám bẩn và luôn mới. 
Tôi nên phân loại và giặt quần áo nhiều màu như thế nào?
Tốt nhất bạn nên giặt riêng quần áo có hoa văn có màu riêng, đồ sẫm màu và đồ sáng. Thông thường, vải màu đã được xử lý để tránh bay màu, nhưng tốt nhất bạn nên giặt những loại quần áo này ở nhiệt độ nước mát hơn.
Làm cách nào để quần áo của tôi không bị phai màu?
Có hai thủ phạm chính khi nói đến sự phai màu ở quần áo chính là nước nóng và ánh sáng mặt trời. Vì thế bạn cần nên hạn chế khi làm sạch quần áo bằng nước nóng và ánh mặt trời. 
Làm thế nào để chăm sóc quần áo thể thao?
Quần áo thể thao và quần áo tập thể dục có thể khó chăm sóc vì chúng thường được làm từ các loại vải đặc biệt. Thế nên, bạn hãy giặt quần áo thể thao ở không bao giờ quá 40 độ để giúp quần áo không bị giãn hoạt mất đi chức năng vốn có của chúng. 
Làm cách nào để quần áo trắng trở lại?
Bạn hãy thử treo chúng dưới ánh sáng mặt trời, vì ánh nắng mặt trời có thể có tác dụng tẩy trắng tự nhiên. Ngoài ra, bạn cũng có thể làm trắng quần áo với một số mẹo tẩy trắng quần áo hiệu quả, nhanh chóng.','Tran Nhat Minh','Public',4),
(N'Instructions on How to Choose Clothes Size Correctly', 'https://scontent.fhan19-1.fna.fbcdn.net/v/t39.30808-6/430978195_18398822632069644_2269195991228336348_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_ohc=zpU90nzQ29gAX-VNAVe&_nc_ht=scontent.fhan19-1.fna&oh=00_AfA5gnf4g1dr0V3H6ChsX7fzl0sTVJTeVkIzLq0DMlte2w&oe=66006DD4', '2024/1/14', N'Mua sắm trực tuyến có thể mang lại nhiều tiện ích, nhưng việc chọn size đúng có thể là một thách thức. Để giúp bạn có trải nghiệm mua sắm trơn tru, dưới đây là hướng dẫn chi tiết về cách chọn size quần áo một cách chính xác.
**1. Đo Lường Cơ Bản
Khi bắt đầu, hãy có bảng đo lường cơ bản của bạn gồm:
Ngực: Đo vòng quanh phần rộng nhất của ngực, dưới cánh tay.
Eo: Đo vòng quanh phần eo tự nhiên của bạn.
Hông: Đo vòng quanh phần rộng nhất của mông.
**2. Kiểm Tra Bảng Size Của Nhãn Hiệu
Mỗi nhãn hiệu thường có bảng size riêng của mình. Hãy kiểm tra bảng size đó và so sánh với các đo lường của bạn. Lưu ý rằng kích thước có thể thay đổi giữa các nhãn hiệu, do đó, luôn nên kiểm tra thông tin size cụ thể của sản phẩm bạn quan tâm.
**3. Đọc Đánh Giá và Phản Hồi từ Khách Hàng
Đọc đánh giá và phản hồi từ những người mua sắm trước có thể cung cấp thông tin quý báu về việc chọn size. Nếu nhiều người khác nhau đều nói về việc sản phẩm chạy lớn hoặc nhỏ so với kích thước thực tế, bạn có thể sử dụng thông tin này để đưa ra quyết định.','Tran Nhat Minh','Public',3)


create table Feedback (
feedbackID int IDENTITY(1,1) primary key not null,
customerID int,
content nvarchar(1000),
productID int,
postDate nvarchar(20),
rate_star float,
[status] nvarchar(20),
FOREIGN KEY (customerID) REFERENCES Customer(customerID),
FOREIGN KEY (productID) REFERENCES [product](id)
)


create table [Order](
orderID int IDENTITY(1,1) primary key NOT NULL,
customerID int,
orderName nvarchar(60),
orderDiscount int,
orderDate Date,
notes nvarchar(1000),
orderAddress nvarchar(100),
orderPhone nvarchar(20),
orderStatus nvarchar(50),
totalCost float,
sellerID int,
FOREIGN KEY (customerID) REFERENCES Customer(customerID)
)

create table orderDetail(
detailID int IDENTITY(1,1) NOT NULL,
orderID int NOT NULL,
productID int,
productPrice money,
quantity int,
totalCost money,
isFeedback varchar(20),
FOREIGN KEY (orderID) REFERENCES [Order](orderID),
FOREIGN KEY (productID) REFERENCES product(id),
)

create table Post(
postID int primary key,
postTitle nvarchar(100),
postImage varchar(500),
postContent nvarchar(100)
)

insert into Post (postID, postTitle, postImage, postContent)
values 
(1, 'Money Island Tee in Cream','https://smakerclothing.com/upload/sanpham/dsc02310-9140.jpg','Featured: Unisex, Oversize, 100% Cotton'),
(2, 'Money Island Short in Cream','https://smakerclothing.com/upload/sanpham/dsc02295-8157.jpg','Featured: Unisex, 100% Mesh')

create table Slider (
sliderID int primary key,
sliderTitle nvarchar(300),
sliderImage varchar(500),
)

insert into Slider(sliderID, sliderTitle, sliderImage)
values 
(1, N'𝐓𝐄𝐓𝐕𝐎𝐕𝐄𝐍 𝐌𝐄𝐑𝐂𝐇 - The never before seen combination between $maker x Lonely Stonie!!!','https://smakerclothing.com/upload/hinhanh/untitled-1-2742.jpg'),
(2, N'$MAKER and LONELY Stonie officially launched products in the collection on December 4, including Money Island Tee in Cream, Money Island Short in Cream','https://smakerclothing.com/upload/hinhanh/untitled-2-4685.jpg'),
(3, N'All the most beautiful "PRODUCTS" are on the shelves at the official $maker website, you can message us directly for advice and online shopping experience.','https://smakerclothing.com/upload/hinhanh/untitled-2-4685.jpg')


