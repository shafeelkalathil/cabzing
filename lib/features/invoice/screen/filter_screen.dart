import 'package:cabzing_driverapp/common/utils/constants/app_colors.dart';
import 'package:cabzing_driverapp/common/utils/style/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import '../../../common/utils/constants/dimensions.dart';
import '../../../common/widgets/appbar/appbar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  DateTime now=DateTime.now();
 late DateTime selectedMonth;
 late DateTime fromDate;
 late DateTime toDate;
 List<String> items=[
   'Customer',
   'Supplier',
   'SuperAdmin',
 ];
 List<String> categories=[
   'Pending',
   'Invoiced',
   'Cancelled',
 ];
 String? selectedItem;
  late TextTheme textTheme;

  int selectedCategory=0;


  Future<void> pickMonth(BuildContext context)async{
   DateTime? selected=await showMonthYearPicker(context: context, initialDate: selectedMonth, firstDate: DateTime(2000), lastDate: now);
   if(selected!=null&&selected!=selectedMonth){
     selectedMonth=DateTime(selected.year,selected.month);
     fromDate=DateTime(selectedMonth.year,selectedMonth.month);
     toDate=DateTime(selectedMonth.year,selectedMonth.month);
     setState(() {

     });
   }
 }
 Future<void> fromDatePick(BuildContext context)async{
   DateTime? selected=await showDatePicker(context: context, initialDate: fromDate, firstDate: DateTime(2000), lastDate: now);
   if(selected!=null&&selected!=selectedMonth){
     selectedMonth=DateTime(selected.year,selected.month);
     setState(() {

     });
   }
 } Future<void> toDatePick(BuildContext context)async{
   DateTime? selected=await showDatePicker(context: context, initialDate: toDate, firstDate: DateTime(2000), lastDate: now);
   if(selected!=null&&selected!=selectedMonth){
     selectedMonth=DateTime(selected.year,selected.month);
     setState(() {

     });
   }
 }

 @override
  void initState() {
    selectedMonth=DateTime(now.year,now.month);
    fromDate=DateTime(now.year,now.month,1,0,0,0);
    toDate=DateTime(now.year,now.month,now.day,23,59,59);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CAppBar(
        title: Text("Filters",style: customTextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
        actions: [
          IconButton(onPressed: () {

          }, icon: const Icon(Iconsax.eye,color: AppColors.primaryColor,)) ,
          IconButton(onPressed: () {

          }, icon: const Text('Filter',style: TextStyle(fontSize:12,color: AppColors.primaryColor),))
        ],
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(color: AppColors.borderColor,thickness: 1,),
            GestureDetector(
              onTap: () {
                pickMonth(context);
              },
              child: Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  color: AppColors.blackShade,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(selectedMonth==now?'This month':DateFormat('MMMM').format(selectedMonth)),
                    const Icon(Icons.arrow_drop_down_rounded)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    fromDatePick(context);
                  },
                  child: Container(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                      color: AppColors.blackShade1,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Iconsax.calendar,color: AppColors.primaryColor,),
                        const SizedBox(width: 5,),
                        Text(DateFormat('dd/MM/yyyy').format(toDate)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                GestureDetector(
                  onTap: () {
                    toDatePick(context);
                  },
                  child: Container(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                      color: AppColors.blackShade1,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Iconsax.calendar,color: AppColors.primaryColor,),
                        const SizedBox(width: 5,),
                        Text(DateFormat('dd/MM/yyyy').format(fromDate)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            const Divider(color: AppColors.borderColor,thickness: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(categories.length, (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory=index;
                    });
                  },
                  child: Container(
                  width: screenWidth * 0.25,
                  height: screenHeight * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenHeight * 0.025),
                    color: selectedCategory==index?AppColors.primaryColor:AppColors.blackShade1,),
                  child: Center(child: Text(categories[index]),)
                ),),
              ),)
            ),
            const SizedBox(height: 10,),
            Container(
              width: screenWidth*0.9,
              height: screenHeight *0.065,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.01),
                border: Border.all(color: AppColors.borderColor),
                color: AppColors.blackShade1,),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton<String>(
                   isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  style: textTheme.bodyMedium,
                  hint: const Text('Select Category'),
                  underline:Container(),
                  value: selectedItem,
                  items:items.map((item)=>DropdownMenuItem(value: item,child:Text(item),)) .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedItem=value;
                    });
                  },
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}


