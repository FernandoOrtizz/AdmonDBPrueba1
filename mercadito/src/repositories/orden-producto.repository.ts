import {DefaultCrudRepository} from '@loopback/repository';
import {OrdenProducto, OrdenProductoRelations} from '../models';
import {MercaditoDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class OrdenProductoRepository extends DefaultCrudRepository<
  OrdenProducto,
  typeof OrdenProducto.prototype.idOrden,
  OrdenProductoRelations
> {
  constructor(
    @inject('datasources.mercadito') dataSource: MercaditoDataSource,
  ) {
    super(OrdenProducto, dataSource);
  }
}
