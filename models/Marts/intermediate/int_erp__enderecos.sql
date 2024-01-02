with
stg_countryregion as (
    select *
    from {{ ref('stg_erp__countryregion') }}
)

,stg_stateprovince as (
    select*
    from {{ ref('stg_erp__stateprovince') }}
)

,join_tabelas as (
    select
     stg_stateprovince.id_estado
    , stg_stateprovince.id_territorio
    , stg_countryregion.Codigo_pais_regiao
    , stg_countryregion.nome_do_pais_regiao
    , stg_stateprovince.codigo_estado_provincia
    , stg_stateprovince.nome_estado_provincia
   
    from stg_stateprovince
    left join stg_countryregion on
       stg_countryregion.Codigo_pais_regiao = stg_stateprovince.Codigo_pais_regiao_provincia
)
,   criar_chaves as (
    select 
    cast(id_estado as string) || cast(codigo_estado_provincia as string) as sk_estado_provincia
    , *
    from join_tabelas
)
select *
from criar_chaves
