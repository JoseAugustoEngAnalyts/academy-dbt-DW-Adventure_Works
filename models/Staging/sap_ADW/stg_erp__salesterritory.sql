with
fonte_salesterritory as (
    select 
    cast (territoryid as int) as id_territorio
    , cast(name as string) as nome_do_pais_territorio_venda
    , cast(countryregioncode as string) as Codigo_pais_regiao_territorio_venda
    , cast(groupp as string) as grupo_territorio_venda
    , cast(salesytd as string) as venda_acumulada_territorio_venda
    , cast(saleslastyear as string) as venda_ultimo_ano_territorio_venda
    , cast(costytd as string) as custo_acumulado_territorio_venda
    , cast(costlastyear as string) as custo_ultimo_ano_territorio_venda
    --, cast(rowguid as string) as 
    --, cast(modifieddate as string) as 
    from {{ source('erp', 'salesterritory') }}
)

select *
from fonte_salesterritory