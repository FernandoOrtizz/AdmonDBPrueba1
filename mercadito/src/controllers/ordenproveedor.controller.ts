import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
} from '@loopback/rest';
import {OrdenProveedor} from '../models';
import {OrdenProveedorRepository} from '../repositories';

export class OrdenproveedorController {
  constructor(
    @repository(OrdenProveedorRepository)
    public ordenProveedorRepository : OrdenProveedorRepository,
  ) {}

  @post('/orden-proveedor', {
    responses: {
      '200': {
        description: 'OrdenProveedor model instance',
        content: {'application/json': {schema: getModelSchemaRef(OrdenProveedor)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(OrdenProveedor, {
            title: 'NewOrdenProveedor',
            
          }),
        },
      },
    })
    ordenProveedor: OrdenProveedor,
  ): Promise<OrdenProveedor> {
    return this.ordenProveedorRepository.create(ordenProveedor);
  }

  @get('/orden-proveedor/count', {
    responses: {
      '200': {
        description: 'OrdenProveedor model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(OrdenProveedor) where?: Where<OrdenProveedor>,
  ): Promise<Count> {
    return this.ordenProveedorRepository.count(where);
  }

  @get('/orden-proveedor', {
    responses: {
      '200': {
        description: 'Array of OrdenProveedor model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(OrdenProveedor, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(OrdenProveedor) filter?: Filter<OrdenProveedor>,
  ): Promise<OrdenProveedor[]> {
    return this.ordenProveedorRepository.find(filter);
  }

  @patch('/orden-proveedor', {
    responses: {
      '200': {
        description: 'OrdenProveedor PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(OrdenProveedor, {partial: true}),
        },
      },
    })
    ordenProveedor: OrdenProveedor,
    @param.where(OrdenProveedor) where?: Where<OrdenProveedor>,
  ): Promise<Count> {
    return this.ordenProveedorRepository.updateAll(ordenProveedor, where);
  }

  @get('/orden-proveedor/{id}', {
    responses: {
      '200': {
        description: 'OrdenProveedor model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(OrdenProveedor, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(OrdenProveedor, {exclude: 'where'}) filter?: FilterExcludingWhere<OrdenProveedor>
  ): Promise<OrdenProveedor> {
    return this.ordenProveedorRepository.findById(id, filter);
  }

  @patch('/orden-proveedor/{id}', {
    responses: {
      '204': {
        description: 'OrdenProveedor PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(OrdenProveedor, {partial: true}),
        },
      },
    })
    ordenProveedor: OrdenProveedor,
  ): Promise<void> {
    await this.ordenProveedorRepository.updateById(id, ordenProveedor);
  }

  @put('/orden-proveedor/{id}', {
    responses: {
      '204': {
        description: 'OrdenProveedor PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() ordenProveedor: OrdenProveedor,
  ): Promise<void> {
    await this.ordenProveedorRepository.replaceById(id, ordenProveedor);
  }

  @del('/orden-proveedor/{id}', {
    responses: {
      '204': {
        description: 'OrdenProveedor DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.ordenProveedorRepository.deleteById(id);
  }
}
