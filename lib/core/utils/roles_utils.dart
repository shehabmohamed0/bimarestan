import 'dart:math';

enum RoleType {
  create,
  read,
  update,
  delete,
  generate;

  static List<RoleType> get crud => [create, read, update, delete];

  @override
  String toString() {
    switch (this) {
      case RoleType.create:
        return '-c';
      case RoleType.read:
        return '-r';
      case RoleType.update:
        return '-u';
      case RoleType.delete:
        return '-d';
      case RoleType.generate:
        return '-gr';
    }
  }
}

enum AppSection {
  workshops,
  employees,
  customers,
  vehicles,
  workOrders,
  finance;

  static List<AppSection> get workshopSections => [
        employees,
        customers,
        vehicles,
        workOrders,
        finance,
      ];
      
  @override
  String toString() {
    switch (this) {
      case AppSection.workshops:
        return 'workshops.ws';
      case AppSection.employees:
        return 'employees.emp';
      case AppSection.customers:
        return 'customers.cus';
      case AppSection.vehicles:
        return 'vehicles.veh';
      case AppSection.workOrders:
        return 'workOrders.wo';
      case AppSection.finance:
        return 'finance.fin';
    }
  }
}
