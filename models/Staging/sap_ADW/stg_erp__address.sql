with
    fonte_address as (
        select
            cast(addressid as int) as id_endereco
            ,cast(stateprovinceid as int) as id_estado
            ,cast(addressline1 as string) as rua
            ,cast(addressline2 as string) as rua_1
            ,cast(city as string) as cidade
            ,cast(postalcode as string) as codigo_postal
            -- , cast  (spatiallocation as string) as Localização_espacial
            ,cast(rowguid as string) as chave
            ,cast(modifieddate as string) as data_de_modificacao
        from {{ source("erp", "address") }}
    )

select *
from fonte_address
