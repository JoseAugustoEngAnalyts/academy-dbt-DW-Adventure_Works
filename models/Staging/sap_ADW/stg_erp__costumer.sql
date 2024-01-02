with
fonte_customer as (
    select 
    cast (customerid as int) as id_consumidor
            , cast(personid as int) as id_cliente
            , cast(storeid as int) as id_loja_cliente
            , cast(territoryid as int) as id_territorio_cliente
            --, cast(rowguid as int) as
            --, cast(modifieddate as int) as
    from {{ source('erp', 'customer') }}
)

select *
from fonte_customer
