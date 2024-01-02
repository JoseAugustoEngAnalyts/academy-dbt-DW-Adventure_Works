with
fonte_countryregion as (
    select 
    cast (countryregioncode as string) as Codigo_pais_regiao
    , cast (name as string) as nome_do_pais_regiao
    --, modifieddate
    from {{ source('erp', 'countryregion') }}
)

select *
from fonte_countryregion