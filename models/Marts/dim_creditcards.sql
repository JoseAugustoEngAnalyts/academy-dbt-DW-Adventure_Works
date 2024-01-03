with
 stg_creditcards as (
    select *
    from {{ ref('stg_erp__creditcards') }}
 )

 ,stg_personcreditcards as(
    select *
    from {{ ref('stg_erp__personcreditcards') }}
 )

 ,join_tabelas as(
    select
    stg_creditcards.id_cartao_de_credito
    , stg_creditcards.tipo_de_cartao
    , stg_creditcards.numero_do_cartao
    , stg_creditcards.gasto_mensal
    , stg_creditcards.ano_expedicao
    , stg_personcreditcards.entidade_de_negocio
    from stg_creditcards
    left join stg_personcreditcards  on
    stg_creditcards.id_cartao_de_credito = stg_personcreditcards.id_cartao_de_credito
 )

    ,criar_chaves as (
        select
        row_number()over(order by id_cartao_de_credito ) as pk_cartao_de_credito
        ,*
        from join_tabelas
    )

    select *
    from criar_chaves
    

 
