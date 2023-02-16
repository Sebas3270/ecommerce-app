import 'dart:convert';

import 'package:ecommerce_app/common/api.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';

class ProductsService extends ChangeNotifier {

  ProductsService(){
    final productsMap = json.decode(productsJson);
    for (var product in productsMap) {
      productsBase.add(Product.fromMap(product));
    }
    getLatestProducts();
  }

  late Product _selectedProduct;
  Product get selectedProduct => _selectedProduct;
  set selectedProduct( Product product ){
    _selectedProduct = product;
    notifyListeners();
  }

  List<Product> productsBase = [];

  List<Product> _searchProducts = [];
  List<Product> get searchProductsList => _searchProducts;
  set searchProductsList( List<Product> products ){
    _searchProducts = products;
    notifyListeners();
  }

  List<Product> _latestProducts = [];
  List<Product> get latestProductsList => _latestProducts;
  set latestProductsList( List<Product> products ){
    _latestProducts = products;
    notifyListeners();
  }

  /// Search products for backend
  void searchProducts( String searchTerm ) async {
    List<Product> newProducts;
    if(searchTerm.isEmpty){
      newProducts = [];
    }else{
      // newProducts = productsBase.where((product) => product.name.startsWith(searchTerm)).toList();
      newProducts = await Api.getSearchProductsApi(searchTerm);
    }
    searchProductsList = newProducts;
  }

  void getLatestProducts() async {
    List<Product> newProducts;
    // newProducts = productsBase.sublist(productsBase.length - 5);
    newProducts = await Api.getLatestProductsApi();
    latestProductsList = newProducts;
  }

  String productsJson = '''
    [{"id":"e8953ca9-184b-4c5b-a4e0-a4fbda3a23a4","name":"Oxcarbazepine","price":2801.7,"image":"http://dummyimage.com/894x249.png/dddddd/000000"},
{"id":"6b632743-e955-4f66-8e87-82a5cb823ae4","name":"calendula officinalis, thuja occidentalis","price":2607.3,"image":"http://dummyimage.com/466x337.png/dddddd/000000"},
{"id":"f1d0c761-a638-4d9f-a8e9-d06f2f7c31d0","name":"TITANIUM DIOXIDE","price":347.2,"image":"http://dummyimage.com/583x426.png/ff4444/ffffff"},
{"id":"8327bfbc-f2bd-48b2-affc-44c52bb33b1b","name":"Diphenhydramine Hydrochloride","price":2447.8,"image":"http://dummyimage.com/407x412.png/dddddd/000000"},
{"id":"c0733f50-abd6-4e5f-9912-57ba2ec0e683","name":"Ofloxaxin","price":489.2,"image":"http://dummyimage.com/808x272.png/cc0000/ffffff"},
{"id":"2cbaf703-b5be-4c72-9e15-4c0c9891414a","name":"TRICLOCARBAN","price":1307.4,"image":"http://dummyimage.com/342x404.png/dddddd/000000"},
{"id":"c7e1bbb5-2130-4618-8843-59b6648f3284","name":"Isoniazid","price":2363.8,"image":"http://dummyimage.com/607x880.png/ff4444/ffffff"},
{"id":"600a3e5c-a9d8-4a69-8964-5d18cc123c43","name":"ISOSORBIDE DINITRATE","price":2626.0,"image":"http://dummyimage.com/305x764.png/ff4444/ffffff"},
{"id":"8cb97f52-ef0d-4171-b8dc-28d0e02505a2","name":"oxycodone hydrochloride and acetaminophen","price":1616.6,"image":"http://dummyimage.com/486x292.png/cc0000/ffffff"},
{"id":"d96de50f-5b88-4089-8cb5-a2efec5496fa","name":"Neomycin Sulfate, Polymyxin B Sulfate, and Pramoxine Hydrochloride","price":2109.6,"image":"http://dummyimage.com/729x384.png/dddddd/000000"},
{"id":"faf62bef-7907-48d5-9758-460c2f1dd0f3","name":"ciprofloxacin","price":1831.2,"image":"http://dummyimage.com/504x834.png/cc0000/ffffff"},
{"id":"bc3c35e5-2fc0-469f-8f75-58b3b80e3b0c","name":"OCTINOXATE, OCTISALATE, TITANIUM DIOXIDE","price":1658.0,"image":"http://dummyimage.com/392x503.png/5fa2dd/ffffff"},
{"id":"90869cdb-29e0-4250-ab84-00c2e8591df0","name":"Cottonwood Fremont","price":2504.6,"image":"http://dummyimage.com/634x221.png/5fa2dd/ffffff"},
{"id":"b3f68c4d-0d57-44f5-9079-2b06bb3865fe","name":"Diltiazem Hydrochloride","price":2923.0,"image":"http://dummyimage.com/609x801.png/5fa2dd/ffffff"},
{"id":"efc679d4-804b-44d0-9e65-c1bcacdc08e1","name":"TITANIUM DIOXIDE, OCTINOXATE, and ZINC OXIDE","price":1665.5,"image":"http://dummyimage.com/792x765.png/ff4444/ffffff"},
{"id":"11782ba5-a3f7-442e-a96c-f61cc97cb85b","name":"CAPTORPIL","price":1873.7,"image":"http://dummyimage.com/741x635.png/5fa2dd/ffffff"},
{"id":"e2b30f2d-3c03-4ae0-a671-c7e1914e48f8","name":"Phenylephrine Hydrochloride","price":503.1,"image":"http://dummyimage.com/848x399.png/5fa2dd/ffffff"},
{"id":"e9a91747-0bd0-46cd-9f99-f058f1fd2a90","name":"Docusate sodium","price":2881.6,"image":"http://dummyimage.com/216x636.png/5fa2dd/ffffff"},
{"id":"f5af9fe4-b2c9-41df-96b5-fceccd159f69","name":"PETROLATUM","price":2538.3,"image":"http://dummyimage.com/273x278.png/ff4444/ffffff"},
{"id":"6d396dfb-4190-4d8a-9aad-165f9bb3904d","name":"Antiseptic handwash","price":2516.3,"image":"http://dummyimage.com/708x187.png/cc0000/ffffff"},
{"id":"846d913a-55da-49f5-8451-cf1fc4d23ed4","name":"DIMETHICONE","price":1711.7,"image":"http://dummyimage.com/539x872.png/dddddd/000000"},
{"id":"725277f4-fd9d-4005-a2a6-04da6750d335","name":"minoxidil","price":1619.3,"image":"http://dummyimage.com/671x628.png/dddddd/000000"},
{"id":"a9ad90c6-38b3-4a28-b20a-cf9549d5870c","name":"betamethasone valerate","price":1651.5,"image":"http://dummyimage.com/385x710.png/dddddd/000000"},
{"id":"cef2a9f5-de6e-4617-bb8b-8a21c40f767d","name":"PROMETHAZINE HYDROCHLORIDE","price":427.0,"image":"http://dummyimage.com/730x859.png/dddddd/000000"},
{"id":"b34573a4-2a54-44ed-8c52-cb8fd258d62b","name":"trifluoperazine hydrochloride","price":1322.5,"image":"http://dummyimage.com/804x776.png/cc0000/ffffff"},
{"id":"827a9807-926d-42ea-bd0c-15db9c555bf8","name":"Amitriptyline Hydrochloride","price":1340.0,"image":"http://dummyimage.com/110x768.png/5fa2dd/ffffff"},
{"id":"9770b658-4ff3-4209-aa2c-bb95b7258881","name":"GALANTAMINE HYDROBROMIDE","price":2463.5,"image":"http://dummyimage.com/636x330.png/cc0000/ffffff"},
{"id":"cfa70f5d-2594-4e2a-ad6b-96509349cbb2","name":"Propranolol Hydrochloride","price":2623.4,"image":"http://dummyimage.com/635x191.png/ff4444/ffffff"},
{"id":"d08b5446-f9bb-4c9f-8d17-5a9052af70a1","name":"Perphenazine","price":1451.6,"image":"http://dummyimage.com/439x762.png/ff4444/ffffff"},
{"id":"b9c90524-e099-4ab6-9add-27453557dcde","name":"Chlorpromazine hydrochloride","price":1910.8,"image":"http://dummyimage.com/396x360.png/dddddd/000000"},
{"id":"c2aff581-d35b-499d-929d-98d66aa3ed2e","name":"warfarin sodium","price":613.3,"image":"http://dummyimage.com/281x682.png/ff4444/ffffff"},
{"id":"a47c5aad-c805-4775-a17d-f6665aea0a41","name":"Titanium Dioxide, Zinc Oxide","price":1543.2,"image":"http://dummyimage.com/890x773.png/dddddd/000000"},
{"id":"80c916e2-064f-4051-a876-b2b118243334","name":"BENZETHONIUM CHLORIDE","price":1450.5,"image":"http://dummyimage.com/536x320.png/ff4444/ffffff"},
{"id":"4a562283-71dd-4fde-98c5-ca6dcfd72a30","name":"Morphine Sulfate","price":919.9,"image":"http://dummyimage.com/868x251.png/ff4444/ffffff"},
{"id":"a4837418-99eb-4e2d-b7e0-4b2321a95238","name":"Milk Whole Cows","price":2095.3,"image":"http://dummyimage.com/161x204.png/dddddd/000000"},
{"id":"b2d12213-f1cb-4389-b9bb-3e6d24451ab1","name":"Avobenzone, Homosalate, Octisalate, Octocrylene, and Oxybenzone","price":2790.8,"image":"http://dummyimage.com/194x502.png/ff4444/ffffff"},
{"id":"096d0ebb-395f-4421-992a-75daa0d366a7","name":"perindopril erbumine","price":702.9,"image":"http://dummyimage.com/819x447.png/5fa2dd/ffffff"},
{"id":"e8a19de3-5f9f-4d43-b97d-69a0285e0dec","name":"Levetiracetam","price":2738.1,"image":"http://dummyimage.com/559x293.png/5fa2dd/ffffff"},
{"id":"d95cebc1-9770-43ca-974f-3afaddd7b20b","name":"ALLANTOIN","price":1540.7,"image":"http://dummyimage.com/115x705.png/5fa2dd/ffffff"},
{"id":"6b29d7cf-ad63-4682-bed8-d9adeae23109","name":"AZITHROMYCIN","price":526.9,"image":"http://dummyimage.com/163x678.png/ff4444/ffffff"},
{"id":"72b1bb37-57ad-4abb-8520-0b7150a84658","name":"METFORMIN HYDROCHLORIDE","price":208.9,"image":"http://dummyimage.com/236x186.png/cc0000/ffffff"},
{"id":"150e0cd8-830e-4e2b-ba8a-0b4a1b00f8b5","name":"Benzalkonium Chloride","price":1588.5,"image":"http://dummyimage.com/378x811.png/dddddd/000000"},
{"id":"9f5bae13-44e6-44e3-bed7-dd09665e797a","name":"Drosera 1X, Mentholum 2X, Convallaria majalis 3X, Lobelia inflata 3X, Stramonium 6X, Aconitum napellus 3X, Ammi visnaga 2X, Kali iodatum 3X","price":2406.8,"image":"http://dummyimage.com/816x879.png/5fa2dd/ffffff"},
{"id":"6e7e4d1b-4c17-4d17-a63d-9d7bf0ef955d","name":"Cefpodoxime Proxetil","price":1735.5,"image":"http://dummyimage.com/646x854.png/dddddd/000000"},
{"id":"831ed194-7d53-4e42-a293-29424bbe0b8f","name":"amlodipine besylate","price":343.0,"image":"http://dummyimage.com/522x429.png/5fa2dd/ffffff"},
{"id":"798d7c94-ce00-4dbb-8426-797654349ae6","name":"Bismuth subsalicylate","price":337.0,"image":"http://dummyimage.com/753x532.png/5fa2dd/ffffff"},
{"id":"d384b220-01d3-4380-9e20-8299262ce0f9","name":"Candida Albicans","price":2574.3,"image":"http://dummyimage.com/676x519.png/cc0000/ffffff"},
{"id":"dc44d5e9-9ff0-4488-ae25-cdbd6b0ee5de","name":"alcohol","price":2622.1,"image":"http://dummyimage.com/422x658.png/ff4444/ffffff"},
{"id":"530451b3-7b1b-4c3a-84d6-f44e5c475ed0","name":"BENZALKONIUM CHLORIDE","price":2741.2,"image":"http://dummyimage.com/882x323.png/ff4444/ffffff"},
{"id":"2c9eeff1-dc2d-4458-85e8-90a28a04328c","name":"Miconazole Nitrate","price":2122.6,"image":"http://dummyimage.com/555x873.png/cc0000/ffffff"},
{"id":"4e304a6c-cf7a-41d2-b525-19c282d92475","name":"PredniSONE","price":2606.1,"image":"http://dummyimage.com/299x590.png/cc0000/ffffff"},
{"id":"7d085419-022a-49e3-9f85-a51c4a8769b1","name":"Pentazocine hydrochloride and naloxone hydrochloride","price":1780.7,"image":"http://dummyimage.com/578x284.png/5fa2dd/ffffff"},
{"id":"96120755-b524-4d3c-8b78-d31bb3910eb2","name":"melphalan","price":2714.7,"image":"http://dummyimage.com/830x180.png/dddddd/000000"},
{"id":"9f4b9aea-b523-49e9-9129-b15fb567744d","name":"antihemophilic factor recombinant","price":1838.5,"image":"http://dummyimage.com/340x545.png/ff4444/ffffff"},
{"id":"48f304c4-3564-489d-a8bf-7819d663b553","name":"Risperidone","price":1201.5,"image":"http://dummyimage.com/826x207.png/5fa2dd/ffffff"},
{"id":"faf19457-c68d-406f-9362-4893f96fb334","name":"Alcohol","price":1759.8,"image":"http://dummyimage.com/628x367.png/5fa2dd/ffffff"},
{"id":"c76b556e-4c7d-4f86-b1db-6d24292039f1","name":"Baclofen","price":2737.9,"image":"http://dummyimage.com/128x120.png/dddddd/000000"},
{"id":"9a456610-99a9-4457-bddd-2576446a6f92","name":"Lisinopril","price":599.1,"image":"http://dummyimage.com/602x593.png/ff4444/ffffff"},
{"id":"2bd93a4d-bd11-4a42-84d1-9adbbf7891b4","name":"Ibuprofen","price":1386.4,"image":"http://dummyimage.com/737x599.png/dddddd/000000"},
{"id":"d3e76bd3-6f8a-4f86-93e7-96d3424f8808","name":"OCTINOXATE, OXYBENZONE","price":314.9,"image":"http://dummyimage.com/182x779.png/dddddd/000000"},
{"id":"76982dd4-c8c3-4c20-867a-4b88e94ebe68","name":"Dimethicone and Pramoxine Hydrochloride","price":2406.2,"image":"http://dummyimage.com/470x168.png/cc0000/ffffff"},
{"id":"cfb5b697-e904-4319-83c0-70fa3a6fca2b","name":"NAPROXEN SODIUM","price":1494.1,"image":"http://dummyimage.com/223x165.png/cc0000/ffffff"},
{"id":"2337841a-c90f-44f4-b0a8-9c550a09eabe","name":"Clorazepate Dipotassium","price":176.1,"image":"http://dummyimage.com/654x397.png/cc0000/ffffff"},
{"id":"795328f7-4a2b-4105-8fc4-52e3c45a9a3a","name":"Octinoxate and Oxybenzone","price":1996.1,"image":"http://dummyimage.com/259x253.png/ff4444/ffffff"},
{"id":"1838c156-d71e-4226-a8b5-8eadd297a10a","name":"lactic acid, l-","price":400.2,"image":"http://dummyimage.com/421x414.png/ff4444/ffffff"},
{"id":"db50f88c-dcf3-4430-ab7e-604ac63b49f3","name":"quinapril","price":760.1,"image":"http://dummyimage.com/823x684.png/5fa2dd/ffffff"},
{"id":"c4fca415-c8a1-4a21-9034-5704f4b6494c","name":"Ibuprofen","price":1641.6,"image":"http://dummyimage.com/618x431.png/ff4444/ffffff"},
{"id":"09da1e95-026d-4aa9-bfd5-43026a86b8d7","name":"Menthol and Methyl Salicylate","price":1644.7,"image":"http://dummyimage.com/850x411.png/5fa2dd/ffffff"},
{"id":"14f8da61-35a1-4942-8a6f-b093b60cc164","name":"PSEUDOGNAPHALIUM OBTUSIFOLIUM, CAUSTICUM, COLCHICUM AUTUMNALE BULB, CITRULLUS COLOCYNTHIS FRUIT PULP, IRON, LITHIUM BENZOATE, TOXICODENDRON PUBESCENS LEAF and FILIPENDULA ULMARIA ROOT","price":710.3,"image":"http://dummyimage.com/155x325.png/dddddd/000000"},
{"id":"877498f9-92b3-41f2-aefb-318908be2d4b","name":"PREGABALIN","price":2476.3,"image":"http://dummyimage.com/841x329.png/ff4444/ffffff"},
{"id":"a13bf32b-11f2-4a4a-87ed-8dc58f57936d","name":"amlodipine besylate","price":1718.4,"image":"http://dummyimage.com/353x543.png/ff4444/ffffff"},
{"id":"b2d8dbeb-9381-48e2-9b22-1785113febc2","name":"Mineral oil, Petrolatum, Phenylephrine HCl, Shark liver oil","price":1198.4,"image":"http://dummyimage.com/721x446.png/cc0000/ffffff"},
{"id":"432e3cb4-bf32-4ba8-b834-49d6ec61d0b9","name":"Octinoxate, Octisalate, Oxybenzone, Titanium Dioxide","price":757.5,"image":"http://dummyimage.com/143x523.png/cc0000/ffffff"},
{"id":"673b3d0b-8635-460d-a9be-7880c5bdd1d5","name":"PYRITHIONE ZINC","price":241.8,"image":"http://dummyimage.com/390x411.png/cc0000/ffffff"},
{"id":"6248a03a-85cb-4e9f-9284-9d072523f4fa","name":"Ethambutol hydrochloride","price":2446.2,"image":"http://dummyimage.com/275x230.png/5fa2dd/ffffff"},
{"id":"84d3dfee-b187-47c5-ae6d-6224ddcf59f6","name":"BENZALKONIUM CHLORIDE","price":946.1,"image":"http://dummyimage.com/332x267.png/ff4444/ffffff"},
{"id":"b9e036cf-64fc-4821-b62f-7a2fb9a76a7b","name":"Glipizide","price":2696.2,"image":"http://dummyimage.com/831x102.png/dddddd/000000"},
{"id":"53228954-1f8c-443f-8193-9dcc05ee2c4c","name":"Benzocaine","price":677.6,"image":"http://dummyimage.com/584x466.png/ff4444/ffffff"},
{"id":"5f6b33b3-ebd1-49f0-85e6-d08d0ca76a0b","name":"Nitroglycerin","price":462.7,"image":"http://dummyimage.com/245x883.png/dddddd/000000"},
{"id":"778c3914-4954-4d2b-8844-2db204a1492c","name":"acyclovir","price":2353.3,"image":"http://dummyimage.com/243x181.png/5fa2dd/ffffff"},
{"id":"318353ec-c3f9-4e20-aa95-831c31a4a507","name":"lisinopril","price":324.8,"image":"http://dummyimage.com/726x467.png/5fa2dd/ffffff"},
{"id":"b989e720-55d5-45c5-8d87-9b5b2ca5d287","name":"Carbidopa and Levodopa","price":205.0,"image":"http://dummyimage.com/492x899.png/5fa2dd/ffffff"},
{"id":"1954d555-4291-4064-b486-2eb94962366e","name":"CYCLOBENZAPRINE HYDROCHLORIDE","price":2634.0,"image":"http://dummyimage.com/546x517.png/cc0000/ffffff"},
{"id":"1e7e6e49-6b63-4e8a-b058-b9c164a33496","name":"Triclosan","price":1120.8,"image":"http://dummyimage.com/405x770.png/ff4444/ffffff"},
{"id":"8fd884cc-6b21-4304-bf1a-fe7ac213d6d3","name":"Oxygen","price":1892.1,"image":"http://dummyimage.com/634x385.png/ff4444/ffffff"},
{"id":"7ca364fb-5d24-4fc4-a1e0-d61e1d99d9cb","name":"HYDROCORTISONE ACETATE","price":1339.6,"image":"http://dummyimage.com/552x641.png/ff4444/ffffff"},
{"id":"37604de2-e85d-401f-b941-f38c1752ce54","name":"metoprolol succinate and hydrochlorothiazide","price":2061.3,"image":"http://dummyimage.com/397x423.png/dddddd/000000"},
{"id":"aa8b5bfe-d524-4b93-ab4a-7ef995ce4eb7","name":"marcaine, lidocaine, kenalog, povidone iodine","price":1022.4,"image":"http://dummyimage.com/509x811.png/ff4444/ffffff"},
{"id":"b53e255f-e73a-49ce-b9ea-b9603912800d","name":"BUPIVACAINE HYDROCHLORIDE","price":1942.4,"image":"http://dummyimage.com/461x226.png/ff4444/ffffff"},
{"id":"18342e8b-feee-41b3-a909-4fb646720ab8","name":"valacyclovir hydrochloride","price":646.9,"image":"http://dummyimage.com/877x636.png/5fa2dd/ffffff"},
{"id":"3ad28b57-3d2d-4317-8c00-e1188c25b6fa","name":"Glycerin","price":1971.5,"image":"http://dummyimage.com/512x859.png/dddddd/000000"},
{"id":"0bc7927e-6579-4ba9-9812-d2584040ff9e","name":"Metoprolol Tartrate","price":1029.8,"image":"http://dummyimage.com/615x489.png/ff4444/ffffff"},
{"id":"72ed765d-72e2-40e8-b9a3-304ed6a1f0e8","name":"Naproxen Sodium","price":402.8,"image":"http://dummyimage.com/879x800.png/dddddd/000000"},
{"id":"1ce58aa8-592b-4369-8541-ff3ad92afec9","name":"Dactylis glomerata","price":2134.6,"image":"http://dummyimage.com/334x855.png/cc0000/ffffff"},
{"id":"17448143-3860-4b41-b182-e3f81b6f4736","name":"Nitrofurantoin Monohydrate/Macrocrystalline","price":849.6,"image":"http://dummyimage.com/542x352.png/dddddd/000000"},
{"id":"0f68cbb7-fb76-4717-a9d7-cbd02f989f5b","name":"Oxycodone Hydrochloride","price":2893.6,"image":"http://dummyimage.com/391x114.png/dddddd/000000"},
{"id":"d4597984-1122-4ec7-b42c-a181f715b7cb","name":"pantoprazole sodium","price":1040.2,"image":"http://dummyimage.com/697x822.png/ff4444/ffffff"},
{"id":"4112cd96-0e50-46b8-a67e-11d95f87c59c","name":"Triclosan","price":1621.4,"image":"http://dummyimage.com/189x508.png/5fa2dd/ffffff"},
{"id":"1e5c65f4-4b62-4f64-bdab-8dd682b64ad1","name":"Arnica montana, Calendula officinalis, Hypericum perforatum, Symphytum officinale, Bellis perennis, Carbo vegetabilis,","price":2830.7,"image":"http://dummyimage.com/195x392.png/dddddd/000000"},
{"id":"824e0421-315c-48d4-b856-db56f3aa4a1a","name":"Amitriptyline Hydrochloride","price":1528.8,"image":"http://dummyimage.com/649x243.png/cc0000/ffffff"},
{"id":"56b1e618-d7f4-4eee-adef-e843368af147","name":"Gabapentin","price":2827.4,"image":"http://dummyimage.com/590x157.png/ff4444/ffffff"},
{"id":"7f82f889-2fc5-4611-9c4c-3d55eedd0f62","name":"TITANIUM DIOXIDE, OCTINOXATE, ARBUTIN, ATRACTYLODES JAPONICA ROOT OIL","price":1263.0,"image":"http://dummyimage.com/715x387.png/ff4444/ffffff"},
{"id":"e9a8a89e-f5e7-46e8-abb6-cfdc2ef0ac52","name":"TRICLOSAN","price":2423.2,"image":"http://dummyimage.com/836x676.png/5fa2dd/ffffff"},
{"id":"0201d418-58f2-420b-b598-45c3c976c47d","name":"acetaminophen and codeine phosphate","price":867.0,"image":"http://dummyimage.com/528x323.png/cc0000/ffffff"},
{"id":"60c485d9-c262-48b8-96db-903984538678","name":"Mineral oil, petrolatum, phenylephrine hcl","price":821.6,"image":"http://dummyimage.com/420x894.png/cc0000/ffffff"},
{"id":"7afbfd53-0092-4ccc-b51f-29e376801787","name":"Chlorpheniramine maleate, Phenylephrine HCl","price":2436.7,"image":"http://dummyimage.com/546x437.png/5fa2dd/ffffff"},
{"id":"3eed4269-2253-470a-8583-c528b624a088","name":"Allantoin","price":653.9,"image":"http://dummyimage.com/644x187.png/5fa2dd/ffffff"},
{"id":"60992a28-ebc3-43b6-887d-207e8058db36","name":"Carbamazepine","price":316.8,"image":"http://dummyimage.com/705x222.png/cc0000/ffffff"},
{"id":"6929d7aa-5a04-4ab5-a853-4642b1583233","name":"docosanol","price":1440.9,"image":"http://dummyimage.com/753x204.png/ff4444/ffffff"},
{"id":"683298c1-0bdf-4b4a-8d8f-e87e1b762b22","name":"Metformin Hydrochloride","price":478.7,"image":"http://dummyimage.com/500x619.png/ff4444/ffffff"},
{"id":"cde61ddb-7fd1-40db-b023-a8f308c3b088","name":"Losartan Potassium and Hydrochlorothiazide","price":291.1,"image":"http://dummyimage.com/427x627.png/ff4444/ffffff"},
{"id":"aa455007-b6b9-4e65-abe5-ea5ac6d8cae7","name":"KALI PHOSPHORICUM","price":466.8,"image":"http://dummyimage.com/894x134.png/cc0000/ffffff"},
{"id":"b8187a9d-2792-4077-8c12-084a67a28d4a","name":"Zidovudine","price":486.3,"image":"http://dummyimage.com/837x673.png/dddddd/000000"},
{"id":"346b946a-aa16-4a71-a9be-34df83dc27b5","name":"FOSINOPRIL SODIUM","price":380.2,"image":"http://dummyimage.com/898x887.png/5fa2dd/ffffff"},
{"id":"d3820100-efee-4387-8f91-52bb8124a91c","name":"Ibuprofen","price":2057.2,"image":"http://dummyimage.com/338x230.png/5fa2dd/ffffff"},
{"id":"0a931de0-2de6-4507-a259-627cb7105ea9","name":"CALENDULA OFFICINALIS FLOWERING TOP, HYPERICUM PERFORATUM, and SODIUM CHLORIDE","price":332.4,"image":"http://dummyimage.com/765x774.png/5fa2dd/ffffff"},
{"id":"95dfd669-9744-4c03-b3da-5025f0bc73d8","name":"PYRITHIONE ZINC","price":669.8,"image":"http://dummyimage.com/118x160.png/ff4444/ffffff"},
{"id":"098ff1be-563e-4d13-bc62-1ad6fda599c9","name":"rabeprazole sodium","price":1741.1,"image":"http://dummyimage.com/335x496.png/ff4444/ffffff"},
{"id":"b5954f66-3f92-4250-b7a1-fc98aa180aec","name":"Venlafaxine Hydrochloride","price":2139.3,"image":"http://dummyimage.com/567x513.png/dddddd/000000"},
{"id":"6675ba10-8e70-40df-ade4-9dcd20cd938d","name":"Carduus marianus, Chelidonium majus, Cinchona officinalis, Lycopodium clavatum, Taraxacum officinale, Veratrum album, Avena sativa, Cynara scolymus, Methylcobalamin, Menadione, a-Lipoicum acidum, Hepar suis,","price":2372.4,"image":"http://dummyimage.com/575x550.png/cc0000/ffffff"},
{"id":"20cdab18-68d5-4b7c-83ec-a7f4c885302c","name":"Pyrithione Zinc","price":2203.5,"image":"http://dummyimage.com/280x461.png/dddddd/000000"},
{"id":"383716b7-4078-4fd0-a646-8c45311a6780","name":"didanosine enteric-coated beadlets","price":1299.2,"image":"http://dummyimage.com/769x286.png/ff4444/ffffff"},
{"id":"2b6e13cf-ddc8-4ec0-b6ad-6d885bfee15a","name":"ZINC OXIDE","price":1788.6,"image":"http://dummyimage.com/161x456.png/ff4444/ffffff"},
{"id":"30a27209-6729-4003-a48b-404ef2fd0873","name":"POISON TREATMENT ADSORBENT SUSPENSION","price":1619.4,"image":"http://dummyimage.com/206x124.png/5fa2dd/ffffff"},
{"id":"47ddb26b-ed1b-4b88-ae5c-c166dad7e84f","name":"Chlorhexidine Diacetate","price":2294.5,"image":"http://dummyimage.com/233x736.png/dddddd/000000"},
{"id":"6a41f91c-98b3-4fcd-b255-da3027b647f0","name":"Metformin Hydrochloride","price":1217.1,"image":"http://dummyimage.com/743x257.png/5fa2dd/ffffff"},
{"id":"4e756b3a-9543-4080-b994-0aa794123cee","name":"lactic acid","price":2044.5,"image":"http://dummyimage.com/421x611.png/dddddd/000000"},
{"id":"e8ef8e42-b055-4a2c-b2d6-892cd4de5a62","name":"Bisoprolol fumarate","price":2641.5,"image":"http://dummyimage.com/729x183.png/dddddd/000000"},
{"id":"4249cf1d-2a22-4711-ad39-f48c4b5d30fe","name":"Clarithromycin","price":2493.7,"image":"http://dummyimage.com/346x741.png/cc0000/ffffff"},
{"id":"a82865ed-1d06-4f3e-9f95-ba0f785f5585","name":"Aluminum Zirconium Tetrachlorohydrex GLY","price":1619.8,"image":"http://dummyimage.com/730x868.png/5fa2dd/ffffff"},
{"id":"ece7c974-4de0-4e85-aac3-8b64cf8147a4","name":"Phenazopyridine HCl","price":1384.7,"image":"http://dummyimage.com/230x301.png/ff4444/ffffff"},
{"id":"35714149-1a44-47de-9d44-7bf77e579785","name":"Dextromethorphan HBr, Guaifenesin","price":1721.4,"image":"http://dummyimage.com/780x100.png/cc0000/ffffff"},
{"id":"07d01cc0-9958-4bd4-af86-1b638b6bfd59","name":"Molds - Mold Mix 4","price":2750.0,"image":"http://dummyimage.com/755x319.png/dddddd/000000"},
{"id":"90318795-6abf-4d45-9ff3-a9d95f0a9c53","name":"Triamterene and Hydrochlorothiazide","price":2290.1,"image":"http://dummyimage.com/264x720.png/5fa2dd/ffffff"},
{"id":"9e3bab1c-ec87-40c8-bf5d-d93040929184","name":"Labetalol hydrochloride","price":393.9,"image":"http://dummyimage.com/102x291.png/ff4444/ffffff"},
{"id":"0e5d74b8-966c-4698-a9f0-5a6277a7d4c7","name":"Trimethobenzamide Hydrochloride","price":1913.2,"image":"http://dummyimage.com/332x403.png/5fa2dd/ffffff"},
{"id":"989b21a6-0564-4bb7-b197-c1e430dc73db","name":"Trandolapril","price":1594.4,"image":"http://dummyimage.com/327x744.png/5fa2dd/ffffff"},
{"id":"a5f3f148-46dd-472f-b7b6-ebc7d35bc05e","name":"Natural Medicine","price":668.2,"image":"http://dummyimage.com/125x585.png/dddddd/000000"},
{"id":"3b4be328-13fe-4ee4-95ef-00f18f2ece8a","name":"Clonidine Hydrochloride","price":863.9,"image":"http://dummyimage.com/633x559.png/5fa2dd/ffffff"},
{"id":"64d62e07-ecd6-493c-8d80-8d6d42d07082","name":"nicotine polacrilex","price":1933.0,"image":"http://dummyimage.com/615x693.png/ff4444/ffffff"},
{"id":"78ab85d4-0fe0-4fb5-8aea-de17c244caf6","name":"diltiazem hydrochloride","price":648.2,"image":"http://dummyimage.com/140x866.png/cc0000/ffffff"},
{"id":"605a84fe-3fd5-4b85-b15d-c8c9394d7604","name":"Naproxen","price":1337.7,"image":"http://dummyimage.com/796x194.png/5fa2dd/ffffff"},
{"id":"a826da50-6249-478c-acf3-569f5a23b461","name":"Dextroamphetamine Saccharate and Amphetamine Aspartate and Dextroamphetamine Sulfate and Amphetamine Sulfate","price":2855.8,"image":"http://dummyimage.com/572x837.png/dddddd/000000"},
{"id":"06897a95-d934-473b-9935-f5a1ee7cd619","name":"Acetaminophen, Aspirin (NSAID), and Caffeine","price":2225.4,"image":"http://dummyimage.com/806x661.png/ff4444/ffffff"},
{"id":"f90e53a4-f18a-4fe7-b016-a2f3acd1fdee","name":"Glycopyrrolate","price":1418.4,"image":"http://dummyimage.com/693x774.png/5fa2dd/ffffff"},
{"id":"a9c53fa2-babd-4ea0-b661-7f14ba36a14c","name":"phenylephrine and witch hazel","price":546.9,"image":"http://dummyimage.com/106x309.png/5fa2dd/ffffff"},
{"id":"a2d174b5-6a54-47ac-afee-ee642d228041","name":"Amoxicillin","price":1592.3,"image":"http://dummyimage.com/588x650.png/cc0000/ffffff"},
{"id":"3a2f57f1-7a92-407b-bf68-b16cdbef817b","name":"Glipizide","price":515.1,"image":"http://dummyimage.com/423x280.png/dddddd/000000"},
{"id":"d43a0d3f-395f-4049-9526-ded8ddcaa3e4","name":"witch hazel","price":2978.3,"image":"http://dummyimage.com/301x369.png/ff4444/ffffff"},
{"id":"66fe12ed-456d-41cd-b2bc-893133b78e3c","name":"ETHYL ALCOHOL","price":2701.1,"image":"http://dummyimage.com/166x538.png/dddddd/000000"},
{"id":"f8619907-c230-4375-b53a-31c2449a2bfe","name":"Loratadine","price":2731.0,"image":"http://dummyimage.com/372x502.png/cc0000/ffffff"},
{"id":"2d011910-2f2e-46b0-ac6d-1b3a7260b576","name":"Gentamicin Sulfate","price":1310.2,"image":"http://dummyimage.com/858x597.png/dddddd/000000"},
{"id":"9caaaa15-cfea-429d-b2df-8597533f18c0","name":"Triticum Aestivum, Chelidonium Majus, Taraxacum Officinale, Glutathione, Hepar Suis, Thyroidinum, Lycopodium Clavatum","price":2171.4,"image":"http://dummyimage.com/582x306.png/dddddd/000000"},
{"id":"de3f6521-1aef-4410-a0e0-faacf1fe5288","name":"Allergenic Extracts Alum Precipitated","price":399.3,"image":"http://dummyimage.com/863x548.png/cc0000/ffffff"},
{"id":"78a2f9f4-c3a6-41c3-87b9-8982df795433","name":"Chlorpheniramine maleate, Phenylephrine HCl","price":2961.4,"image":"http://dummyimage.com/693x395.png/ff4444/ffffff"},
{"id":"29c2dcc0-46fc-4cb7-a6d6-82728d055354","name":"PYRITHIONE ZINC","price":2533.6,"image":"http://dummyimage.com/606x302.png/dddddd/000000"},
{"id":"3bd79fb6-edc8-42a6-843f-8c28f88a5d13","name":"Lisinopril and hydrochlorothiazide","price":1668.0,"image":"http://dummyimage.com/498x653.png/5fa2dd/ffffff"},
{"id":"19771390-9171-4445-8ab1-090b7130081d","name":"Losartan Potassium and Hydrochlorothiazide","price":724.5,"image":"http://dummyimage.com/497x671.png/ff4444/ffffff"},
{"id":"a9118059-af0e-4452-8452-57ddb2f1f4aa","name":"norethindrone acetate and ethinyl estradiol","price":1686.1,"image":"http://dummyimage.com/546x371.png/cc0000/ffffff"},
{"id":"4bd29c47-885a-4edd-be4f-65273b624605","name":"MENTHOL AND ZINC OXIDE","price":2210.2,"image":"http://dummyimage.com/896x448.png/cc0000/ffffff"},
{"id":"ad0dd78f-de30-40d2-b7ff-47b74ac22e34","name":"Methocarbamol","price":1258.3,"image":"http://dummyimage.com/173x120.png/ff4444/ffffff"},
{"id":"155e60c9-8cd5-478f-a808-6b8ac8cc24ce","name":"Levetiracetam","price":2623.9,"image":"http://dummyimage.com/593x621.png/cc0000/ffffff"},
{"id":"53120530-2ab8-49c2-b039-fe9594bca44c","name":"Allscale","price":1696.4,"image":"http://dummyimage.com/461x169.png/dddddd/000000"},
{"id":"eca07a4f-02e6-4fe5-9e8a-b68a4cdd2627","name":"Acetaminophen, Aspirin, Caffeine","price":654.3,"image":"http://dummyimage.com/855x360.png/dddddd/000000"},
{"id":"5eb1b815-7d32-4cbb-9421-6226eda40afc","name":"Bisacodyl","price":665.7,"image":"http://dummyimage.com/798x372.png/5fa2dd/ffffff"},
{"id":"9724b324-d4bd-497d-a8d9-665a25fce808","name":"Ascorbic Acid","price":1754.7,"image":"http://dummyimage.com/695x317.png/ff4444/ffffff"},
{"id":"17c7bb1f-b0ee-4656-8e4a-44d3d711a7ed","name":"Potassium Chloride","price":996.3,"image":"http://dummyimage.com/265x556.png/5fa2dd/ffffff"},
{"id":"f0fcf61a-345e-4f0c-b1e1-6674986292c1","name":"Acetaminophen, Dextromethorphan HBr, Doxylamine succinate, Phenylephrine HCl","price":261.3,"image":"http://dummyimage.com/122x787.png/dddddd/000000"},
{"id":"f14dcbac-737f-41ad-b74a-600d1cde9719","name":"atenolol","price":381.3,"image":"http://dummyimage.com/670x295.png/5fa2dd/ffffff"},
{"id":"bd40292f-30b7-4e54-82b2-44a96254bd6f","name":"Avobenzone, octinoxate","price":1233.1,"image":"http://dummyimage.com/897x203.png/cc0000/ffffff"},
{"id":"5eab9658-249b-415d-a60f-d1de7bd179b7","name":"Irbesartan and Hydrochlorothiazide","price":593.6,"image":"http://dummyimage.com/595x569.png/5fa2dd/ffffff"},
{"id":"752a3f90-e885-4e84-bd9b-18eb40e8d4db","name":"Cold or Allergy","price":2289.3,"image":"http://dummyimage.com/198x652.png/ff4444/ffffff"},
{"id":"a3700af8-c995-403b-9e2e-d9dc984c8bc1","name":"Allergenic Extracts Alum Precipitated","price":418.5,"image":"http://dummyimage.com/281x256.png/5fa2dd/ffffff"},
{"id":"5d687b3e-2b97-4e99-a409-1ffb2e7bbb31","name":"Lemon","price":1468.2,"image":"http://dummyimage.com/115x360.png/ff4444/ffffff"},
{"id":"87d54fbb-3243-45fe-9e41-74f5f61785cc","name":"glipizide","price":550.1,"image":"http://dummyimage.com/350x402.png/cc0000/ffffff"},
{"id":"9b6f7ef6-964f-4513-b719-c1dcd4ffef87","name":"RIBAVIRIN","price":680.7,"image":"http://dummyimage.com/306x703.png/dddddd/000000"},
{"id":"583daf0f-f16b-4dcd-a063-d0a24592cbfe","name":"Diphenhydramine HCl, Zinc acetate","price":589.2,"image":"http://dummyimage.com/576x875.png/5fa2dd/ffffff"},
{"id":"6029c722-c989-4b74-9075-3f5c7d38c80f","name":"aluminum chlorhydrate","price":1127.5,"image":"http://dummyimage.com/192x569.png/cc0000/ffffff"},
{"id":"0d82b125-aa2a-4d89-bfaf-a7316c164e11","name":"Paroxetine Hydrochloride","price":1324.5,"image":"http://dummyimage.com/494x858.png/5fa2dd/ffffff"},
{"id":"b67ae94c-0670-4bca-9a39-0f3a84cdba91","name":"Cefazolin Sodium","price":1150.8,"image":"http://dummyimage.com/283x720.png/ff4444/ffffff"},
{"id":"79e25306-5b33-4ae2-8d88-19237fa9684b","name":"methyl salicylate and menthol","price":2718.3,"image":"http://dummyimage.com/129x505.png/cc0000/ffffff"},
{"id":"42a214fd-a57d-4bd4-85b7-fb55a70e837c","name":"ropinirole","price":2952.8,"image":"http://dummyimage.com/372x866.png/5fa2dd/ffffff"},
{"id":"4964176c-2115-4cd5-a9b8-5bd51961bcf1","name":"Benzocaine","price":118.6,"image":"http://dummyimage.com/683x510.png/dddddd/000000"},
{"id":"120b6f5a-5287-4e2c-abc8-36453fa4c30f","name":"Fluoride","price":1507.0,"image":"http://dummyimage.com/686x420.png/dddddd/000000"},
{"id":"89d2917a-661d-40d1-99ff-ff0439834d0b","name":"Furosemide","price":1214.0,"image":"http://dummyimage.com/283x250.png/ff4444/ffffff"},
{"id":"c5f365b8-b36a-4ca7-8b32-f07e68903b2c","name":"torsemide","price":1018.1,"image":"http://dummyimage.com/333x593.png/5fa2dd/ffffff"},
{"id":"f48055b0-aead-458e-aa38-10ffe3e0707f","name":"OCTINOXATE and TITANIUM DIOXIDE","price":386.0,"image":"http://dummyimage.com/491x754.png/dddddd/000000"},
{"id":"93857e44-542b-4b71-99a1-92c512089412","name":"MENTHOL, METHYL SALICYLATE","price":1042.2,"image":"http://dummyimage.com/899x596.png/ff4444/ffffff"},
{"id":"f6f806de-99ca-4be8-87e9-4c5c2e6e1c17","name":"furosemide","price":771.4,"image":"http://dummyimage.com/536x337.png/cc0000/ffffff"},
{"id":"3fe98a69-a666-4cb4-9af8-20145c569f9a","name":"Atenolol","price":361.1,"image":"http://dummyimage.com/557x770.png/dddddd/000000"},
{"id":"329cc74d-0a1c-4ace-967c-114ee690c3c6","name":"Diclofenac Sodium","price":1395.8,"image":"http://dummyimage.com/107x861.png/ff4444/ffffff"},
{"id":"63d04136-7f4a-4084-9d6b-d018c784eef8","name":"Avobenzone, Octisalate, Octocrylene, and Oxybenzone","price":1299.7,"image":"http://dummyimage.com/181x113.png/cc0000/ffffff"},
{"id":"7e066994-5905-4158-8288-3bbb06a4ee89","name":"Natural Medicine","price":2256.9,"image":"http://dummyimage.com/236x552.png/cc0000/ffffff"},
{"id":"a5318a90-74ce-48a3-be00-c8a28e3ed8f0","name":"Thalidomide","price":2025.0,"image":"http://dummyimage.com/195x705.png/ff4444/ffffff"},
{"id":"eeb28d04-110f-463b-8c31-3071fc73bd0c","name":"Alcohol","price":1310.6,"image":"http://dummyimage.com/522x798.png/5fa2dd/ffffff"},
{"id":"d9518720-025c-4597-ab53-5428904a131e","name":"Air Pods Pro","price":2082.6,"image":"https://www.kubux.mx/web/image/product.template/5/image_1024?unique=0d3dd3a"},
{"id":"62ec2991-3793-4ea0-98b7-f0046a46331f","name":"Huawei P50 256gb","price":2547.3,"image":"https://img01.huaweifile.com/sg/ms/co/pms/uomcdn/CO_HW_B2C/pms/202208/gbom/6941487261024/428_428_B787FD155916721059A1EED309C9715Bmp.png"},
{"id":"854d28d0-55a8-41f9-b553-405a6dfe9602","name":"Galaxy Buds","price":2296.2,"image":"https://cdn.shopify.com/s/files/1/0805/4543/products/SamsungGalaxyBluetoothBuds-Black_1024x1024.png?v=1600331876"},
{"id":"74874d05-0401-447a-b400-f4eaf18bf070","name":"PAEONIA OFFICINALIS ROOT","price":844.3,"image":"http://dummyimage.com/407x115.png/dddddd/000000"},
{"id":"ebf60417-6e6e-4029-a0a1-9d7ac7427af9","name":"ivacaftor","price":1960.1,"image":"http://dummyimage.com/247x352.png/ff4444/ffffff"}]
 ''';

}