import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "GridView",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> listbooks = new List();

  var books = [
    {
      "judul": "Enjoy Flutter",
      "penulis": "Yuzmi Putra Wiraganda",
      "image": "https://miro.medium.com/max/2560/0*GCjXjAXchFHkWeR5.jpeg"
    },
    {
      "judul": "Flutter Basic",
      "penulis": "UCoding.com",
      "image": "https://miro.medium.com/max/1080/0*YdYQjkKLlAhlL40X.jpg"
    },
    {
      "judul": "Flutter E-Commerce",
      "penulis": "UCoding.com",
      "image":
          "http://www.udacoding.com/wp-content/uploads/2019/05/Flutter-E-commerce.jpg"
    },
    {
      "judul": "Happy Flutter",
      "penulis": "Yuzmi Putra Wiraganda",
      "image":
          "https://s0.bukalapak.com/img/08315247331/w-1000/Buku_Happy_Flutter_Membuat_aplikasi_android_dan_ios_dengan_M.png"
    }
  ];

  _buatlist() async {
    for (var i = 0; i < books.length; i++) {
      final book = books[i];
      final String gambar = book["image"];

      listbooks.add(Container(
          padding: EdgeInsets.all(5.0),
          child: Card(
            child: Column(
              children: <Widget>[
                Hero(
                    tag: book['judul'],
                    child: Material(
                      child: InkWell(
                        onTap: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new Detail(
                                      judul: book['judul'],
                                      penulis: book['penulis'],
                                      image: gambar,
                                    ))),
                        child: Image(
                          image: NetworkImage("$gambar"),
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Text(
                  book["judul"],
                  style: TextStyle(fontSize: 20.0),
                )
              ],
            ),
          )));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text("Books"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: listbooks,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.judul, this.penulis, this.image});

  final String judul;
  final String penulis;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          // Layout Gambar
          Container(
              child: Hero(
            tag: judul,
            child: Material(
              child: Image(
                image: NetworkImage("$image"),
                fit: BoxFit.cover,
              ),
            ),
          )),

          // Layout Judul dan Penulis
          BagianNama(
            judul: judul,
            penulis: penulis,
          ),

          // Layout Bottom
          BagianBottom(),

          // Layout Detail
          BagianDetail()
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.judul, this.penulis});

  final String judul;
  final String penulis;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  judul,
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(penulis, style: TextStyle(fontSize: 16.0))
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.red,
                size: 35.0,
              ),
              Text(
                "4.5",
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BagianDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Deskripsi dari buku yang ditampilkan, mulai dari judul buku, penulis buku, rating buku hingga harga buku",
            style: TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}

class BagianBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          IconText(
            icon: Icons.chat,
            title: "Chat",
          ),
          IconText(
            icon: Icons.add_shopping_cart,
            title: "Add Cart",
          ),
          IconText(
            icon: Icons.favorite,
            title: "Favorite",
          ),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  IconText({this.icon, this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue,
            size: 40.0,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
