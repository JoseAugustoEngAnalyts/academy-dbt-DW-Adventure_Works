with
fonte_stateprovince as (
    select 
    cast (stateprovinceid as int) as id_estado
    , cast (territoryid as string) as id_territorio
    , cast (stateprovincecode as string) as codigo_estado_provincia
    , cast (countryregioncode as string) as Codigo_pais_regiao_provincia
    , cast (name as string) as nome_estado_provincia
    --, cast (rowguid as string) as
    --, cast (modifieddate as string) as
    from {{ source('erp', 'stateprovince') }}
)
select *
from fonte_stateprovince