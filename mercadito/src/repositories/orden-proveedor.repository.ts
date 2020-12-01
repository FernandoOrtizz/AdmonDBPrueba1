import {DefaultCrudRepository} from '@loopback/repository';
import {OrdenProveedor, OrdenProveedorRelations} from '../models';
import {MercaditoDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class OrdenProveedorRepository extends DefaultCrudRepository<
  OrdenProveedor,
  typeof OrdenProveedor.prototype.idOrden,
  OrdenProveedorRelations
> {
  constructor(
    @inject('datasources.mercadito') dataSource: MercaditoDataSource,
  ) {
    super(OrdenProveedor, dataSource);
  }
}
