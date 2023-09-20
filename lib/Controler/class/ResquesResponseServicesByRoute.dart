// To parse this JSON data, do
//
//     final servicesByRoute = servicesByRouteFromJson(jsonString);

import 'dart:convert';

List<ServicesByRoute> servicesByRouteFromJson(String str) => List<ServicesByRoute>.from(json.decode(str).map((x) => ServicesByRoute.fromJson(x)));

String servicesByRouteToJson(List<ServicesByRoute> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicesByRoute {
    Driver independentDriver;
    int chairsAvailable;
    String nameService;
    String description;
    String initialAddress;
    String serviceStartTime;
    IndependentRoute independentRoute;
    int reservation;
    String startTime;
    int id;
    State state;
    dynamic serviceFinishTime;
    IndependentVehicle independentVehicle;
    DateTime startDate;
    String finalAddress;

    ServicesByRoute({
        required this.independentDriver,
        required this.chairsAvailable,
        required this.nameService,
        required this.description,
        required this.initialAddress,
        required this.serviceStartTime,
        required this.independentRoute,
        required this.reservation,
        required this.startTime,
        required this.id,
        required this.state,
        required this.serviceFinishTime,
        required this.independentVehicle,
        required this.startDate,
        required this.finalAddress,
    });

    factory ServicesByRoute.fromJson(Map<String, dynamic> json) => ServicesByRoute(
        independentDriver: Driver.fromJson(json["independentDriver"]),
        chairsAvailable: json["chairsAvailable"],
        nameService: json["nameService"],
        description: json["description"],
        initialAddress: json["initialAddress"],
        serviceStartTime: json["serviceStartTime"],
        independentRoute: IndependentRoute.fromJson(json["independentRoute"]),
        reservation: json["reservation"],
        startTime: json["startTime"],
        id: json["id"],
        state: State.fromJson(json["state"]),
        serviceFinishTime: json["serviceFinishTime"],
        independentVehicle: IndependentVehicle.fromJson(json["IndependentVehicle"]),
        startDate: DateTime.parse(json["startDate"]),
        finalAddress: json["finalAddress"],
    );

    Map<String, dynamic> toJson() => {
        "independentDriver": independentDriver.toJson(),
        "chairsAvailable": chairsAvailable,
        "nameService": nameService,
        "description": description,
        "initialAddress": initialAddress,
        "serviceStartTime": serviceStartTime,
        "independentRoute": independentRoute.toJson(),
        "reservation": reservation,
        "startTime": startTime,
        "id": id,
        "state": state.toJson(),
        "serviceFinishTime": serviceFinishTime,
        "IndependentVehicle": independentVehicle.toJson(),
        "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "finalAddress": finalAddress,
    };
}

class Driver {
    State categoryLicence;
    String licenceNumber;
    DateTime licenceExpiration;
    int id;
    String pushToken;
    User user;
    Urbanization urbanization;
    bool status;

    Driver({
        required this.categoryLicence,
        required this.licenceNumber,
        required this.licenceExpiration,
        required this.id,
        required this.pushToken,
        required this.user,
        required this.urbanization,
        required this.status,
    });

    factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        categoryLicence: State.fromJson(json["categoryLicence"]),
        licenceNumber: json["licenceNumber"],
        licenceExpiration: DateTime.parse(json["licenceExpiration"]),
        id: json["id"],
        pushToken: json["pushToken"],
        user: User.fromJson(json["user"]),
        urbanization: Urbanization.fromJson(json["urbanization"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "categoryLicence": categoryLicence.toJson(),
        "licenceNumber": licenceNumber,
        "licenceExpiration": "${licenceExpiration.year.toString().padLeft(4, '0')}-${licenceExpiration.month.toString().padLeft(2, '0')}-${licenceExpiration.day.toString().padLeft(2, '0')}",
        "id": id,
        "pushToken": pushToken,
        "user": user.toJson(),
        "urbanization": urbanization.toJson(),
        "status": status,
    };
}

class State {
    DateTime updateDate;
    dynamic companyid;
    int id;
    String? parameterName;
    ParameterRelationShip parameterRelationShip;
    String parameterValue;
    Updater updater;

    State({
        required this.updateDate,
        required this.companyid,
        required this.id,
        required this.parameterName,
        required this.parameterRelationShip,
        required this.parameterValue,
        required this.updater,
    });

    factory State.fromJson(Map<String, dynamic> json) => State(
        updateDate: DateTime.parse(json["updateDate"]),
        companyid: json["companyid"],
        id: json["id"],
        parameterName: json["parameterName"],
        parameterRelationShip: ParameterRelationShip.fromJson(json["parameterRelationShip"]),
        parameterValue: json["parameterValue"],
        updater: Updater.fromJson(json["updater"]),
    );

    Map<String, dynamic> toJson() => {
        "updateDate": updateDate.toIso8601String(),
        "companyid": companyid,
        "id": id,
        "parameterName": parameterName,
        "parameterRelationShip": parameterRelationShip.toJson(),
        "parameterValue": parameterValue,
        "updater": updater.toJson(),
    };
}

class ParameterRelationShip {
    DateTime updateDate;
    int id;
    dynamic parameterName;
    String parameterValue;

    ParameterRelationShip({
        required this.updateDate,
        required this.id,
        required this.parameterName,
        required this.parameterValue,
    });

    factory ParameterRelationShip.fromJson(Map<String, dynamic> json) => ParameterRelationShip(
        updateDate: DateTime.parse(json["updateDate"]),
        id: json["id"],
        parameterName: json["parameterName"],
        parameterValue: json["parameterValue"],
    );

    Map<String, dynamic> toJson() => {
        "updateDate": updateDate.toIso8601String(),
        "id": id,
        "parameterName": parameterName,
        "parameterValue": parameterValue,
    };
}

class Updater {
    int? id;

    Updater({
        required this.id,
    });

    factory Updater.fromJson(Map<String, dynamic> json) => Updater(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}

class Urbanization {
    int id;
    String nameUrbanization;
    String address;
    String numberContact;
    bool status;

    Urbanization({
        required this.id,
        required this.nameUrbanization,
        required this.address,
        required this.numberContact,
        required this.status,
    });

    factory Urbanization.fromJson(Map<String, dynamic> json) => Urbanization(
        id: json["id"],
        nameUrbanization: json["nameUrbanization"],
        address: json["address"],
        numberContact: json["numberContact"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameUrbanization": nameUrbanization,
        "address": address,
        "numberContact": numberContact,
        "status": status,
    };
}

class User {
    String firstName;
    String lastName;
    ProfilePicture profilePicture;
    DateTime updateDate;
    String identification;
    String phoneNumber;
    State roleId;
    State identificationType;
    int id;
    String email;
    State status;
    Updater updater;

    User({
        required this.firstName,
        required this.lastName,
        required this.profilePicture,
        required this.updateDate,
        required this.identification,
        required this.phoneNumber,
        required this.roleId,
        required this.identificationType,
        required this.id,
        required this.email,
        required this.status,
        required this.updater,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicture: ProfilePicture.fromJson(json["profilePicture"]),
        updateDate: DateTime.parse(json["updateDate"]),
        identification: json["identification"],
        phoneNumber: json["phoneNumber"],
        roleId: State.fromJson(json["roleId"]),
        identificationType: State.fromJson(json["identificationType"]),
        id: json["id"],
        email: json["email"],
        status: State.fromJson(json["status"]),
        updater: Updater.fromJson(json["updater"]),
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture.toJson(),
        "updateDate": updateDate.toIso8601String(),
        "identification": identification,
        "phoneNumber": phoneNumber,
        "roleId": roleId.toJson(),
        "identificationType": identificationType.toJson(),
        "id": id,
        "email": email,
        "status": status.toJson(),
        "updater": updater.toJson(),
    };
}

class ProfilePicture {
    dynamic qrUrl;
    dynamic qrName;
    Updater contractingCompany;
    String nameFile;
    int id;
    Updater user;
    String url;
    State fileType;

    ProfilePicture({
        required this.qrUrl,
        required this.qrName,
        required this.contractingCompany,
        required this.nameFile,
        required this.id,
        required this.user,
        required this.url,
        required this.fileType,
    });

    factory ProfilePicture.fromJson(Map<String, dynamic> json) => ProfilePicture(
        qrUrl: json["qrUrl"],
        qrName: json["qrName"],
        contractingCompany: Updater.fromJson(json["contractingCompany"]),
        nameFile: json["nameFile"],
        id: json["id"],
        user: Updater.fromJson(json["user"]),
        url: json["url"],
        fileType: State.fromJson(json["fileType"]),
    );

    Map<String, dynamic> toJson() => {
        "qrUrl": qrUrl,
        "qrName": qrName,
        "contractingCompany": contractingCompany.toJson(),
        "nameFile": nameFile,
        "id": id,
        "user": user.toJson(),
        "url": url,
        "fileType": fileType.toJson(),
    };
}

class IndependentRoute {
    Driver independentDriver;
    int id;
    String nameRoute;
    Urbanization urbanization;
    bool status;

    IndependentRoute({
        required this.independentDriver,
        required this.id,
        required this.nameRoute,
        required this.urbanization,
        required this.status,
    });

    factory IndependentRoute.fromJson(Map<String, dynamic> json) => IndependentRoute(
        independentDriver: Driver.fromJson(json["independentDriver"]),
        id: json["id"],
        nameRoute: json["nameRoute"],
        urbanization: Urbanization.fromJson(json["urbanization"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "independentDriver": independentDriver.toJson(),
        "id": id,
        "nameRoute": nameRoute,
        "urbanization": urbanization.toJson(),
        "status": status,
    };
}

class IndependentVehicle {
    State color;
    Driver driver;
    int passengerQuanitity;
    DateTime soatExpiration;
    State vehicleClass;
    String plate;
    String model;
    int id;
    Urbanization urbanization;
    DateTime technomechanicsExpiration;
    bool status;

    IndependentVehicle({
        required this.color,
        required this.driver,
        required this.passengerQuanitity,
        required this.soatExpiration,
        required this.vehicleClass,
        required this.plate,
        required this.model,
        required this.id,
        required this.urbanization,
        required this.technomechanicsExpiration,
        required this.status,
    });

    factory IndependentVehicle.fromJson(Map<String, dynamic> json) => IndependentVehicle(
        color: State.fromJson(json["color"]),
        driver: Driver.fromJson(json["driver"]),
        passengerQuanitity: json["passengerQuanitity"],
        soatExpiration: DateTime.parse(json["soatExpiration"]),
        vehicleClass: State.fromJson(json["vehicleClass"]),
        plate: json["plate"],
        model: json["model"],
        id: json["id"],
        urbanization: Urbanization.fromJson(json["urbanization"]),
        technomechanicsExpiration: DateTime.parse(json["technomechanicsExpiration"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "color": color.toJson(),
        "driver": driver.toJson(),
        "passengerQuanitity": passengerQuanitity,
        "soatExpiration": soatExpiration.toIso8601String(),
        "vehicleClass": vehicleClass.toJson(),
        "plate": plate,
        "model": model,
        "id": id,
        "urbanization": urbanization.toJson(),
        "technomechanicsExpiration": technomechanicsExpiration.toIso8601String(),
        "status": status,
    };
}
