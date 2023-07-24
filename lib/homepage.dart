import 'package:flutter/material.dart';

class Exam extends StatefulWidget {
  const Exam({super.key});

  @override
  State<Exam> createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  List<Widget> listclear(){
    Ico.clear();
    Ico[0] = Icon(Icons.abc);
    return Ico;
  }
  List<String> Quest = [
  'الضوء ينتقل أسرع من الصوت.' ,
    'مدينة الفاتيكان بلد.' ,
    'ملبورن هي عاصمة أستراليا'
  ];
  List<String> img = [
    'images/image-1.jpg' ,
    'images/image-2.jpg' ,
    'images/image-3.jpg' ,
  ];
  List<Widget> Ico = [
    Icon(Icons.abc),
  ];
  List<int> answ = [
    1,
    1,
    0,
  ];
  var counter = 0;
  var x;
  var counterx = 0;
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Center(child: Text("اختر الاجابة الصحيحة")),
        ),
        body: Container(
          child: Column(children: [
            SizedBox(height: 40,),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(8.0),
                child:SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for(int i=1;counterx>=i;i++)
                        Ico[i],
                    ],
                  ),
                ),
                )

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(img[counter] , width: double.infinity,height: 350,fit: BoxFit.fitHeight),
            ),
            SizedBox(height: 40,),
            Directionality(
                textDirection: TextDirection.rtl,
                child: Text(Quest[counter] , style: TextStyle(fontSize: 20,fontFamily: 'tijwal'),)),
            SizedBox(height: 40,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                onPressed: (){
                  setState(() {
                    answ[counter] == 1 ? Ico.add(Icon(Icons.thumb_up))
                        :Ico.add(Icon(Icons.thumb_down));
                    counter == 2 ? counter = 0 : counter++ ;
                    counterx++;
                  });
                }, child: Container(
              width: 300,
              height: 60,
              child: Center(child: Text("صح" ,style: TextStyle(fontSize: 30),)),)),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent
                ),
                onPressed: (){
                  setState(() {
                    answ[counter] == 0 ? Ico.add(Icon(Icons.thumb_up))
                        :Ico.add(Icon(Icons.thumb_down));
                    counter == 2 ? counter = 0 : counter++;
                    counterx++;
                  });
                }, child: Container(
              width: 300,
              height: 60,
              child: Center(child: Text("خطأ" ,style: TextStyle(fontSize: 30),)),))
          ],),
        ),
      ),
    );
  }
}
