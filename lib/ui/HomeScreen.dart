import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:impero_it_services/apiManager/repository/categoryRepository.dart';
import 'package:impero_it_services/apiManager/urls.dart';
import 'package:impero_it_services/confiq/constants.dart';
import 'package:impero_it_services/models/categoryData.dart';
import 'package:impero_it_services/models/reqModels/categoryDto.dart';
import 'package:impero_it_services/models/reqModels/productDto.dart';
import 'package:impero_it_services/ui/testStripScreeen.dart';
import 'package:impero_it_services/ui/widgets/imageWidget.dart';
import 'package:loadmore/loadmore.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<Tab> _tabs = List<Tab>();
  List<Widget> _generalWidgets = List<Widget>();
  bool isLoading = true, callIndexCategory = true, callIndexProduct = true;
  int pageIndexCategory = 1;
  int pageIndexProduct = 1;
  TabController _tabController;
  CategoryDTO _dto;
  ProductDTO _productDTO;
  List<CategoryData> categories;

  @override
  Future<void> initState() {
    super.initState();
    callAPI();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ))
        : Scaffold(
            backgroundColor: Colors.black,
            appBar: new AppBar(
              backgroundColor: Colors.black87,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TestStripScreen()));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: IconButton(icon: Icon(Icons.search), onPressed: () {}),
                )
              ],
              bottom: new TabBar(
                indicatorColor: Colors.transparent,
                labelStyle: TextStyle(
                  fontSize: 18.0,
                ),
                //For Selected tab
                unselectedLabelStyle: TextStyle(
                  fontSize: 12.0,
                ),
                isScrollable: true,
                tabs: _tabs,
                controller: _tabController,
              ),
            ),
            body: new TabBarView(
              controller: _tabController,
              children: getWidgets(),
            ),
          );
  }

  Future<bool> _loadMoreSubCategory() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    if (callIndexCategory) {
      callAPI();
      return false;
    } else {
      return true;
    }
  }

  Future<bool> _loadMoreProduct(int subCatId) async {
    print("onLoadMore");
    if (callIndexProduct) {
      callProductAPI(subCatId);
      await Future.delayed(Duration(seconds: 0, milliseconds: 100));
      return false;
    } else {
      return true;
    }
  }

  Future<void> callAPI() async {
    var deviceInfo = DeviceInfoPlugin();
    var androidDeviceInfo = await deviceInfo.androidInfo;
    _dto = CategoryDTO();
    _dto.categoryId = 0;
    _dto.deviceMenufacturer = androidDeviceInfo.manufacturer;
    _dto.deviceModel = androidDeviceInfo.model;
    _dto.deviceToken = androidDeviceInfo.androidId;
    _dto.pageIndex = pageIndexCategory;
    CategoryRepository().getCategoryList(categoryUrl, _dto).then((value) async {
      if (value.status == 200) {
        setState(() {
          isLoading = false;
          _tabs = getTabs(value.result.category);
          _tabController = new TabController(length: _tabs.length, vsync: this);
          categories = value.result.category;
          pageIndexCategory = pageIndexCategory++;
          callIndexCategory = true;
        });
      } else {
        callIndexCategory = false;
      }
    });
  }

  Future<void> callProductAPI(int subCatId) async {
    _productDTO = ProductDTO();
    _productDTO.subCategoryId = subCatId;
    _productDTO.pageIndex = pageIndexProduct;
    CategoryRepository()
        .getProductList(productUrl, _productDTO)
        .then((value) async {
      if (value.status == 200) {
        setState(() {
          isLoading = false;
          pageIndexProduct = pageIndexProduct + 1;
          callIndexProduct = true;
          categories[0].subCategories[subCatId].product = value.result;
          /* _tabs = getTabs(value.result.category);
          _tabController = new TabController(length: _tabs.length, vsync: this);
          categories = value.result.category;
          pageIndex = pageIndex++;*/
        });
      } else {
        callIndexProduct = false;
      }
    });
  }

  List<Tab> getTabs(List<CategoryData> categoryData) {
    _tabs.clear();
    for (int i = 0; i < categoryData.length; i++) {
      _tabs.add(getTab(categoryData[i].name));
    }
    return _tabs;
  }

  Tab getTab(String tabName) {
    return Tab(
      text: "$tabName",
    );
  }

  List<Widget> getWidgets() {
    _generalWidgets.clear();
    for (int i = 0; i < _tabs.length; i++) {
      _generalWidgets.add(getWidget(i));
    }
    return _generalWidgets;
  }

  Widget getWidget(int catId) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      child: Container(
        color: Colors.white,
        child: LoadMore(
          isFinish: categories[0].subCategories.length > 5,
          whenEmptyLoad: true,
          textBuilder: (status) {
            return "";
          },
          onLoadMore: _loadMoreSubCategory,
          child: ListView.builder(
              itemCount: categories[0].subCategories.length,
              itemBuilder: (context, item) {
                return Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${categories[0].subCategories[item].name}',
                        style: subCategoryName,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 5,
                        margin: EdgeInsets.only(top: 10),
                        child: LoadMore(
                          isFinish:
                              categories[0].subCategories[item].product.length >
                                  5,
                          whenEmptyLoad: false,
                          textBuilder: (status) {
                            return "";
                          },
                          onLoadMore: () => _loadMoreProduct(
                              categories[0].subCategories[item].id),
                          child: ListView.builder(
                              itemCount: categories[0]
                                  .subCategories[item]
                                  .product
                                  .length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, productItem) {
                                return Container(
                                    padding: EdgeInsets.all(5),
                                    child: ImageWidget(
                                      imageUrl: categories[0]
                                          .subCategories[item]
                                          .product[productItem]
                                          .imageName,
                                      priceCode: categories[0]
                                          .subCategories[item]
                                          .product[productItem]
                                          .priceCode,
                                      productName: categories[0]
                                          .subCategories[item]
                                          .product[productItem]
                                          .name,
                                    ));
                              }),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
      /**/
    );
  }
}
