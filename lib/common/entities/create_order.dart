class CreateOrderRequestEntity {
  final String method;
  final double amount;
  final int classroomId;
  final String note;

  CreateOrderRequestEntity({
    required this.method,
    required this.amount,
    required this.classroomId,
    required this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      'method': method,
      'amount': amount,
      'classroom_id': classroomId,
      'note': note,
    };
  }
}

class CreateOrderResponseEntity {
  final bool success;
  final TuitionOrderData data;

  CreateOrderResponseEntity({required this.success, required this.data});

  factory CreateOrderResponseEntity.fromJson(Map<String, dynamic> json) {
    return CreateOrderResponseEntity(
      success: json['success'],
      data: TuitionOrderData.fromJson(json['data']),
    );
  }
}

class TuitionOrderData {
  final int tuitionId;
  final Order order;

  TuitionOrderData({required this.tuitionId, required this.order});

  factory TuitionOrderData.fromJson(Map<String, dynamic> json) {
    return TuitionOrderData(
      tuitionId: json['tuition_id'],
      order: Order.fromJson(json['order']),
    );
  }
}

class Order {
  final String id;
  final String status;
  final List<OrderLink> links;

  Order({required this.id, required this.status, required this.links});

  factory Order.fromJson(Map<String, dynamic> json) {
    var linksList = (json['links'] as List)
        .map((linkJson) => OrderLink.fromJson(linkJson))
        .toList();
    return Order(
      id: json['id'],
      status: json['status'],
      links: linksList,
    );
  }
}

class OrderLink {
  final String href;
  final String rel;
  final String method;

  OrderLink({required this.href, required this.rel, required this.method});

  factory OrderLink.fromJson(Map<String, dynamic> json) {
    return OrderLink(
      href: json['href'],
      rel: json['rel'],
      method: json['method'],
    );
  }
}
