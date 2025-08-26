import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:flutter/material.dart';

class UnitDetailsView extends StatelessWidget {
  const UnitDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssetsManager.productPhoto),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // overlay buttons
                Positioned(
                  top: 50,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: Icon(Icons.share, color: Colors.white),
                  ),
                ),
                // Price Tag
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.brown.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "السعر يبدأ من 25,250,000 ﷼",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "شقة فاخرة في الرياض",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.bed),
                          SizedBox(width: 5),
                          Text("3 غرف"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.bathtub),
                          SizedBox(width: 5),
                          Text("3 حمام"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.square_foot),
                          SizedBox(width: 5),
                          Text("2112 م²"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Info Table
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: const [
                        ListTile(
                          title: Text("السعر يبدأ من"),
                          trailing: Text("25,000,000 ﷼"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("التفاصيل"),
                          trailing: Text("3 غرف نوم - 3 حمامات"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("المساحة المبنية"),
                          trailing: Text("2112 م²"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("التشطيب"),
                          trailing: Text("تشطيب كامل"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("التسليم في"),
                          trailing: Text("12/2027"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("الواجهة"),
                          trailing: Text("شمال غربي"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Services Section
                  const Text(
                    "خدمات الوحدة",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: const [
                        ListTile(
                          leading: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          title: Text("مصعد"),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          title: Text("سطح خاص"),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          title: Text("توفر الكهرباء"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // About Section
                  const Text(
                    "عن الوحدة",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "هناك العديد من الأنواع المتوفرة لتصوص لوريم إيبسوم ...",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // Similar Units
                  const Text(
                    "وحدات مشابهة",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) => Container(
                        width: 200,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage(AppAssetsManager.productPhoto),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(16),
                              ),
                            ),
                            child: const Text(
                              "فيلا دوبلكس - العوالي رايز",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("سجل اهتمامك"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("حدد موعد للمقابلة"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
