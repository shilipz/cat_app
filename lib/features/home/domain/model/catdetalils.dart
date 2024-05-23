/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class Breed {
    String? id;
    String? name;
    String? vetstreeturl;
    String? vcahospitalsurl;
    String? temperament;
    String? origin;
    String? description;
    String? lifespan;
    String? wikipediaurl;

    Breed({this.id, this.name, this.vetstreeturl, this.vcahospitalsurl, this.temperament, this.origin, this.description, this.lifespan, this.wikipediaurl}); 

    Breed.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        vetstreeturl = json['vetstreet_url'];
        vcahospitalsurl = json['vcahospitals_url'];
        temperament = json['temperament'];
        origin = json['origin'];
        description = json['description'];
        lifespan = json['life_span'];
        wikipediaurl = json['wikipedia_url'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['name'] = name;
        data['vetstreet_url'] = vetstreeturl;
        data['vcahospitals_url'] = vcahospitalsurl;
        data['temperament'] = temperament;
        data['origin'] = origin;
        data['description'] = description;
        data['life_span'] = lifespan;
        data['wikipedia_url'] = wikipediaurl;
        return data;
    }
}

class Root {
    List<Breed?>? breeds;
    String? id;
    String? url;
    int? width;
    int? height;

    Root({this.breeds, this.id, this.url, this.width, this.height}); 

    Root.fromJson(Map<String, dynamic> json) {
        if (json['breeds'] != null) {
         breeds = <Breed>[];
         json['breeds'].forEach((v) {
         breeds!.add(Breed.fromJson(v));
        });
      }
        id = json['id'];
        url = json['url'];
        width = json['width'];
        height = json['height'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['breeds'] =breeds != null ? breeds!.map((v) => v?.toJson()).toList() : null;
        data['id'] = id;
        data['url'] = url;
        data['width'] = width;
        data['height'] = height;
        return data;
    }
}
