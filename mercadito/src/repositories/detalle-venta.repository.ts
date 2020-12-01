import {DefaultCrudRepository} from '@loopback/repository';
import {DetalleVenta, DetalleVentaRelations} from '../models';
import {MercaditoDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class DetalleVentaRepository extends DefaultCrudRepository<
  DetalleVenta,
  typeof DetalleVenta.prototype.id,
  DetalleVentaRelations
> {
  constructor(
    @inject('datasources.mercadito') dataSource: MercaditoDataSource,
  ) {
    super(DetalleVenta, dataSource);
  }
}
