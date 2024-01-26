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

create database Swp_Project

create table product
(
[id] int identity(1,1) primary key,
[name] nvarchar(60) UNIQUE NULL,
[original_price] money NULL,
[sale_price] money NULL,
quantity int,
[describe] nvarchar(1000) NULL,
[image] nvarchar(100) NULL,
cid int,
sellerID int
FOREIGN KEY (cid) REFERENCES Category(cid),
)

insert into product([name],[original_price],[sale_price],quantity,describe,[image],cid,sellerID)
values 
 ('$MAKER THINGS TEE IN WHITE',600.000,500.00,20,N'Unisex,Oversize,100% Cotton,In nổi,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9477-1710.jpg',1,1),
 ('I GOT HOMIES IN SAUDI TEE IN BLACK',500.000,400.00,14,N'Unisex,Oversize,100% Cotton,In nổi,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9495-2979.jpg',1,1),
 ('I GOT MONEY IN SAUDI TEE IN WHITE',500.000,400.00,11,N'Unisex,Oversize,100% Cotton,In nổi,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9491-3408.jpg',1,1),
 ('YACHT CLUB TANK TOP IN DARK PURPLE',600.000,500.00,10,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9521-6368.jpg',1,1),
 ('YACHT CLUB TEE IN BROWN',600.000,500.00,12,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9514-4152.jpg',1,1),
 ('MONEY ON MY MIND TEE IN BLACK',550.000,450.00,13,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9444-8531.jpg',1,1),
 ('EMBOSSED LOGOS STRAIGHT JEANS',950.000,850.00,17,N'Unisex,Straigh form,Denim,Model wears size 32','https://smakerclothing.com/upload/sanpham/dsc02893-4369.jpg',2,1),
 ('BORN BROKE DIE RICH MESH SHORT IN CREAM',650.000,550.00,15,N'Unisex,100% Mesh,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf9407-4077.jpg',3,3),
 ('STRIPES KHAKI PANTS IN BROWN',800.000,700.00,18,N'Unisex,Straight Fit,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dscf8299-9001.jpg',4,3),
 ('$MAKER STRAIGHT JEANS IN BLUE',800.000,700.000,12,N'Unisex,Straigh form,Denim,Model wears size 32','https://smakerclothing.com/upload/sanpham/dscf8683-0961.jpg',2,3),
 ('LOGO STRAIGHT JEANS IN LIGHT BLUE',850.000,750.000,14,N'Unisex,Straigh form,Denim,Model wears size 32','https://smakerclothing.com/upload/sanpham/dscf7049-7331.jpg',2,3),
 ('$MAKER SHORT ON FIRE IN BLACK',700.000,600.000,19,N'Unisex,Draper & Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc00766-4281.jpg',3,3),
 ('$MAKER CORDUROY SHORT IN TAN',650.000,550.000,13,N'Unisex,100% Mesh,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc00754-4189.jpg',3,3),
 ('$MAKER X SWE CARGO FLARE PANTS IN BROWN',750.000,650.000,11,'NUnisex,Straigh form,100% jean,Model wears size L','https://smakerclothing.com/upload/sanpham/1-(5)-1007.jpg',4,3),
 ('CUSTOMIZE FLARE SWEAT PANTS IN BLACK',1150.000,1050.000,20,N'Hand made custom (vẽ sơn bằng tay),Unisex,100% Cotton ( Nỉ ),Model wears size L','https://smakerclothing.com/upload/sanpham/img_6182-0014.jpg',4,3)

insert into product([name],original_price,[sale_price],quantity,describe,[image],cid,sellerID)
values 
 ('NONE OF THIS MATTERS ANYMORE TEE IN CREAM',550.000,450.00,17,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc00138-9101.jpg',1,1),
  ('CHAMPION TEE IN WHITE',550.000,450.00,17,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc00133-0775.jpg',1,1),
 ('420 PICNIC TEE IN BLACK',600.000,500.00,15,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc00747-2973.jpg',1,1),
 ('MONEY IS A BAD MASTER TEE IN BLACK',550.000,450.00,12,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc09817-1991.jpg',1,3),
 ('THE LOGOS TEE IN BLACK',600.000,500.00,16,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc09747-4373.jpg',1,3),
  ('TENVOVEN MERCH MONEY ISLAND SHORTS IN CREAM',650.000,550.00,17,N'Unisex,100% Mesh,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc02295-8157.jpg',3,1),
  ('TETVOVEN MERCH MONEY ISLAND TEE IN CREAM',650.000,550.00,17,N'Unisex,Oversize,100% Cotton,Model wears size L','https://smakerclothing.com/upload/sanpham/dsc02310-9140.jpg',1,1)


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
userPoint float,
FOREIGN KEY (roleID) REFERENCES Roles(roleID)
)

drop table Roles

create table Roles (
roleID int primary key,
roleName nvarchar(20)
)

insert into Roles (roleID, roleName)
values 
(1, 'Seller'),
(2, 'Admin')

create table Blog (
blogID int primary key,
blogTitle nvarchar(100),
blogImage varchar(500),
postDate Date,
content nvarchar(3000),
author varchar(45),
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

select top 1 * from Blog
order by blogID desc

select * from Blog
where blogTitle like N'%phối màu%'

select bc.blogCategoryName from Blog b join Blog_Category bc
on b.blogCategoryID = bc.blogCategoryID
where b.blogID = ?

select * from Blog
where blogID = ?

insert into Blog(blogID, blogTitle, blogImage, postDate, content, author, blogCategoryID)
values
(4, N'Thời Trang: Nghệ Thuật Tự Chủ và Sự Phát Triển Vượt Bậc', 'https://scontent.fhan2-4.fna.fbcdn.net/v/t39.30808-6/411148108_18382762387069644_8280629814671464533_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=3635dc&_nc_ohc=qP7mHXz8u3EAX_ghWtA&_nc_ht=scontent.fhan2-4.fna&oh=00_AfAB2-j2biGThCqx-PxSvlZJiIWBLpunTdZfjgK2pCYMXw&oe=65B0DB34','2024/1/16', 
N'Thời trang không chỉ là cách chúng ta ăn mặc mỗi ngày; nó là biểu tượng của cái đẹp, cái độc đáo và sự sáng tạo. Thời trang không chỉ thể hiện gu thẩm mỹ cá nhân mà còn là ngôn ngữ giao tiếp của chính bản thân chúng ta.
Ngày nay, thời trang không chỉ được tạo ra từ thế giới của các nhà thiết kế nổi tiếng mà còn bắt nguồn từ đời sống hàng ngày, nghệ thuật đương đại và sự đa dạng văn hóa. Chúng ta sẽ cùng nhau khám phá những xu hướng đang thịnh hành và cách chúng ảnh hưởng đến cộng đồng thời trang.
Nhìn xa về tương lai, chúng ta sẽ dự đoán những xu hướng sáng tạo và đa dạng trong thế giới thời trang. Cùng nhau suy nghĩ về những thách thức và cơ hội mà thời trang đang đối mặt trong thời kỳ tiếp theo.
Hãy đồng hành cùng chúng tôi trong hành trình khám phá vô tận của thế giới thời trang. Thời trang không chỉ là việc ăn mặc, mà là cách chúng ta diễn đạt bản thân và giao tiếp với thế giới xung quanh. Chúng ta là những nghệ sĩ tự do trên sân khấu lớn của cuộc sống, mỗi bộ trang phục là một tác phẩm nghệ thuật tự chủ.
','Tran Nhat Minh',1),
(3, N'BẬT MÍ NHỮNG NGUYÊN TẮC PHỐI MÀU QUẦN ÁO SÀNH ĐIỆU', 'https://scontent.fhan2-4.fna.fbcdn.net/v/t39.30808-6/418757647_18387104926069644_3641350815995318898_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=3635dc&_nc_ohc=8-oF4NUBrXYAX-7RH-7&_nc_ht=scontent.fhan2-4.fna&oh=00_AfBa-xB9AjLOGQb72KTXWKCdm7wcy52Iprn_GCYjp3zkcw&oe=65AFC2D6','2024/1/16', 
N'Nguyên tắc phối màu quần áo theo bánh xe màu sắc:
1.Mix quần áo theo nguyên tắc màu sắc tương phản:
Quy tắc phối màu quần áo theo cặp màu tương phản, tức là: Bạn sẽ mix đồ theo hai màu đối diện nhau trên bánh xe màu sắc. Cặp màu tương phải giúp tạo nên một set đồ rực rỡ, nổi bật. Cách phối màu này cực kỳ phù hợp với những các bạn trẻ ưa thích màu sắc, sự tươi trẻ và nổi bật nhất trong bộ cánh của mình.
2.Mix quần áo theo nguyên tắc màu sắc liền kề:
Một lựa chọn an toàn hơn và trở nên chỉn chu trong mọi hoàn cảnh. Chính là phối màu quần áo nữ theo nguyên tắc liền kề. Tức là mix bộ đồ của bạn với 2 gam màu liền kề nhau trong bảng phối màu quần áo.
3.Phối màu quần áo đơn sắc:
Ton sur ton là cụm từ vô cùng quen thuộc đối với tín đồ thời trang thứ thiệt. Một cây quần áo kết hợp từ gam màu đơn sắc. Dù là đi theo phong cách mix màu tương phản hay liền kề đều sẽ đem lại một bộ cánh rất ổn, sành điệu, sang trọng, thanh lịch.
4.Phối màu quần áo theo gam màu trung tính:
Xám, trắng, ghi, nâu là những gam màu trung tính được yêu thích nhất trong thời trang. Bạn hãy nắm chắc nguyên tắc kết hợp 1 gam màu trung tính sáng và 1 gam màu trung tính tối trên bộ đồ của bạn. Couple TX chắc chắn bạn sẽ ngạc nhiên với vẻ đẹp sang trọng, khéo léo, lại hết sức nổi bật của chính mình.
','Tran Nhat Minh',2),
(2, N'Cách giữ quần áo luôn mới và bền lâu trong thời gian dài', 'https://scontent.fhan2-3.fna.fbcdn.net/v/t39.30808-6/415523161_18386108434069644_8625410621395145107_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=3635dc&_nc_ohc=7VClmt38UT0AX8AiQa4&_nc_ht=scontent.fhan2-3.fna&oh=00_AfDz0Na7ez4GVLZcCEFMhxAsyjer0iW6v-fFpPWSNVbq_Q&oe=65B0A1D4', '2024/1/14', N'Làm cách nào để tẩy vết bẩn mà không làm phai quần áo?
Làm sạch vết bẩn càng nhanh càng tốt chính là cách giúp quần áo sạch đơn giản và hiệu quả nhất. Việc làm sạch nhanh sẽ giúp quần áo không bị bám bẩn và luôn mới. 
Tôi nên phân loại và giặt quần áo nhiều màu như thế nào?
Tốt nhất bạn nên giặt riêng quần áo có hoa văn có màu riêng, đồ sẫm màu và đồ sáng. Thông thường, vải màu đã được xử lý để tránh bay màu, nhưng tốt nhất bạn nên giặt những loại quần áo này ở nhiệt độ nước mát hơn.
Làm cách nào để quần áo của tôi không bị phai màu?
Có hai thủ phạm chính khi nói đến sự phai màu ở quần áo chính là nước nóng và ánh sáng mặt trời. Vì thế bạn cần nên hạn chế khi làm sạch quần áo bằng nước nóng và ánh mặt trời. 
Làm thế nào để chăm sóc quần áo thể thao?
Quần áo thể thao và quần áo tập thể dục có thể khó chăm sóc vì chúng thường được làm từ các loại vải đặc biệt. Thế nên, bạn hãy giặt quần áo thể thao ở không bao giờ quá 40 độ để giúp quần áo không bị giãn hoạt mất đi chức năng vốn có của chúng. 
Làm cách nào để quần áo trắng trở lại?
Bạn hãy thử treo chúng dưới ánh sáng mặt trời, vì ánh nắng mặt trời có thể có tác dụng tẩy trắng tự nhiên. Ngoài ra, bạn cũng có thể làm trắng quần áo với một số mẹo tẩy trắng quần áo hiệu quả, nhanh chóng.','Tran Nhat Minh',4),
(1, N'Hướng Dẫn Cách Chọn Size Quần Áo Đúng Cách', 'https://scontent.fhan2-4.fna.fbcdn.net/v/t39.30808-6/414671296_18384639349069644_256342315157973909_n.jpg?stp=dst-jpg_s960x960&_nc_cat=104&ccb=1-7&_nc_sid=3635dc&_nc_ohc=yoYFCY6XawwAX8p4MDl&_nc_ht=scontent.fhan2-4.fna&oh=00_AfDaUAZcgv5EAKMCaWIA0od8T_SfyNV1iiPylb4vG1C5Yg&oe=65B17E4C', '2024/1/14', N'Mua sắm trực tuyến có thể mang lại nhiều tiện ích, nhưng việc chọn size đúng có thể là một thách thức. Để giúp bạn có trải nghiệm mua sắm trơn tru, dưới đây là hướng dẫn chi tiết về cách chọn size quần áo một cách chính xác.
**1. Đo Lường Cơ Bản
Khi bắt đầu, hãy có bảng đo lường cơ bản của bạn gồm:
Ngực: Đo vòng quanh phần rộng nhất của ngực, dưới cánh tay.
Eo: Đo vòng quanh phần eo tự nhiên của bạn.
Hông: Đo vòng quanh phần rộng nhất của mông.
**2. Kiểm Tra Bảng Size Của Nhãn Hiệu
Mỗi nhãn hiệu thường có bảng size riêng của mình. Hãy kiểm tra bảng size đó và so sánh với các đo lường của bạn. Lưu ý rằng kích thước có thể thay đổi giữa các nhãn hiệu, do đó, luôn nên kiểm tra thông tin size cụ thể của sản phẩm bạn quan tâm.
**3. Đọc Đánh Giá và Phản Hồi từ Khách Hàng
Đọc đánh giá và phản hồi từ những người mua sắm trước có thể cung cấp thông tin quý báu về việc chọn size. Nếu nhiều người khác nhau đều nói về việc sản phẩm chạy lớn hoặc nhỏ so với kích thước thực tế, bạn có thể sử dụng thông tin này để đưa ra quyết định.','Tran Nhat Minh',3)


create table Feedback (
feedbackID int primary key not null,
customerID int,
content nvarchar(1000),
productID int,
postDate Date,
rate_star float,
FOREIGN KEY (customerID) REFERENCES Customer(customerID),
FOREIGN KEY (productID) REFERENCES [product](id)
)

create table OrderStatus (
orderStatusID int primary key,
orderStatusName nvarchar(20)
)

insert into OrderStatus(orderStatusID, orderStatusName)
values
(1, 'Wait confirmation'),
(2, 'Wait delivery'),
(3, 'Successful delivery'),
(4, 'Order canceled'),
(5, 'Refunds/Exchanges')

create table [Order](
orderID int IDENTITY(1,1) primary key NOT NULL,
customerID int,
orderName nvarchar(60),
orderStatusID int,
orderDiscount int,
orderDate Date,
notes nvarchar(1000),
orderAddress nvarchar(100),
orderPhone nvarchar(20),
FOREIGN KEY (customerID) REFERENCES Customer(customerID),
FOREIGN KEY (orderStatusID) REFERENCES orderStatus(orderStatusID)
)

create table orderDetail(
detailID int IDENTITY(1,1) NOT NULL,
orderID int NOT NULL,
productID int,
productPrice money,
quantity int,
totalCost money,
FOREIGN KEY (orderID) REFERENCES [Order](orderID),
FOREIGN KEY (productID) REFERENCES product(id),
)

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

select * from [Order]
select * from orderDetail
select * from Customer
drop table Customer
select * from Category
create table Post(
postID int primary key,
postTitle nvarchar(100),
postImage varchar(500),
postContent nvarchar(100)
)

select top 2 * from Post
order by postID desc

insert into Post (postID, postTitle, postImage, postContent)
values 
(1, 'Money Island Tee in Cream','https://smakerclothing.com/upload/sanpham/dsc02310-9140.jpg','Featured: Unisex, Oversize, 100% Cotton'),
(2, 'Money Island Short in Cream','https://smakerclothing.com/upload/sanpham/dsc02295-8157.jpg','Featured: Unisex, 100% Mesh')

create table Slider (
sliderID int primary key,
sliderTitle nvarchar(300),
sliderImage varchar(500),
)

select top 3 * from Slider
where sliderID between ? and ?
order by sliderID asc

delete from Slider
select * from slider

insert into Slider(sliderID, sliderTitle, sliderImage)
values 
(1, N'𝐓𝐄𝐓𝐕𝐎𝐕𝐄𝐍 𝐌𝐄𝐑𝐂𝐇 - Sự kết hợp chưa bao giờ có giữa $maker x Lonely Stonie!!!','https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-6/407952110_373587438548216_4304779013064929915_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=dd5e9f&_nc_ohc=dLxGeeB1VKgAX8JZjBo&_nc_ht=scontent.fhan14-3.fna&oh=00_AfCOARYBwVwwKNXQJntzG0Rok6SneAJ9qYncbQ1oW0dXsg&oe=65ACB153'),
(2, N'$MAKER và LONELY Stonie chính thức ra mắt các sản phẩm thuộc BST vào ngày 04.12, bao gồm Money Island Tee in Cream, Money Island Short in Cream','https://scontent.fhan14-2.fna.fbcdn.net/v/t39.30808-6/407973804_373587568548203_1578083566043200816_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=dd5e9f&_nc_ohc=OkZHSoLXEBcAX9oOMtf&_nc_ht=scontent.fhan14-2.fna&oh=00_AfDPtQhzGqDayhMh1M_pugxxcmSy97Qefb2ATUu31EoCwQ&oe=65AD5FC3'),
(3, N'Toàn bộ các “SẢN PHẨM” đẹp nhất đã lên kệ tại website chính thức $maker, bạn có thể nhắn tin trực tiếp cho chúng mình để được tư vấn và trải nghiệm mua sắm Online.','https://scontent.fhan14-1.fna.fbcdn.net/v/t39.30808-6/407994871_373587491881544_5926347277153163150_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=dd5e9f&_nc_ohc=VSRBy4vNBBQAX_aRK8M&_nc_ht=scontent.fhan14-1.fna&oh=00_AfC6yhRdvPNkKfy6h8w119_UHwaBZhk6kkxuFu_fPOLsgA&oe=65ADA0CD')

