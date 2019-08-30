INSERT INTO public.account (ies_id,name_pt,name_en,financial_statement,current_noncurrent,asset_liability_equity,sum_value,ebitda,ebit,ebt,net_results) VALUES 
('A00001','Vendas e serviços prestados','Turnover','pl',NULL,NULL,false,true,true,true,true)
,('A00002','Subsídios à exploração','Operating grants','pl',NULL,NULL,false,true,true,true,true)
,('A00003','Ganhos/perdas imputados de subsidiárias, associadas e empreendimentos conjuntos','Gains/Losses imputaded to subsidiaries, associated, joint ventures','pl',NULL,NULL,false,true,true,true,true)
,('A00004','Variação nos inventários de produção','Inventories of production change','pl',NULL,NULL,false,true,true,true,true)
,('A00005','Trabalhos para a própria entidade','Own work capitalized','pl',NULL,NULL,false,true,true,true,true)
,('A00006','Custo das mercadorias vendidas e das matérias consumidas','Cost of goods sold and consumed','pl',NULL,NULL,false,true,true,true,true)
,('A00007','Fornecimento e serviços externos','External supplies and services','pl',NULL,NULL,false,true,true,true,true)
,('A00008','Gastos com pessoal','Employees expenses','pl',NULL,NULL,false,true,true,true,true)
,('A00009','Imparidade (perdas/reversões)','','pl',NULL,NULL,false,true,true,true,true)
,('A00010','Imparidade / ajustamentos de inventários (perdas/reversões)','Impairment of inventories (losses/reversions)','pl',NULL,NULL,false,true,true,true,true)
;
INSERT INTO public.account (ies_id,name_pt,name_en,financial_statement,current_noncurrent,asset_liability_equity,sum_value,ebitda,ebit,ebt,net_results) VALUES 
('A00011','Imparidade de dívidas a receber (perdas/reversões)','Impairment of debts (losses/reversions)','pl',NULL,NULL,false,true,true,true,true)
,('A00012','Provisões (aumentos/reduções)','Provisions (increases/decreases)','pl',NULL,NULL,false,true,true,true,true)
,('A00013','Imparidade de investimentos não depreciáveis /amortizáveis (perdas/reversões)','Imparity of non depreciable/amortisable investments (losses/reversions)','pl',NULL,NULL,false,true,true,true,true)
,('A00014','Outras imparidades (perdas/reversões)','Impairment-other (losses/reversions)','pl',NULL,NULL,false,true,true,true,true)
,('A00015','Aumentos / reduções de justo valor','Increases/decreases of fair value','pl',NULL,NULL,false,true,true,true,true)
,('A00016','Outros rendimentos','Other revenues and gains','pl',NULL,NULL,false,true,true,true,true)
,('A00017','Outros gastos','Other expenses and losses','pl',NULL,NULL,false,true,true,true,true)
,('A00018','Resultado antes de depreciações, gastos de financiamento e impostos','Result before taxes, interests, depreciation and amortisation','pl',NULL,NULL,true,true,true,true,true)
,('A00019','Gastos / reversões de depreciação e de amortização','Expenses/reversions of depreciation and amortisation','pl',NULL,NULL,false,false,true,true,true)
,('A00020','Imparidade de investimentops depreciáveis / amortizáveis (perdas / reversões)','Imparities of depreciable/amortisable investments (losses/reversions)','pl',NULL,NULL,false,false,true,true,true)
;
INSERT INTO public.account (ies_id,name_pt,name_en,financial_statement,current_noncurrent,asset_liability_equity,sum_value,ebitda,ebit,ebt,net_results) VALUES 
('A00021','Resultado operacional (antes de gastos de financiamento e impostos)','Result before interests and taxes','pl',NULL,NULL,true,false,true,true,true)
,('A00022','Juros e rendimentos similiares obtidos','Interests and similary revenues','pl',NULL,NULL,false,false,false,true,true)
,('A00023','Juros e gastos similares obtidos','Interests and similary expenses','pl',NULL,NULL,false,false,false,true,true)
,('A00024','Resultado antes de impostos','Result before taxes','pl',NULL,NULL,true,false,false,true,true)
,('A00025','Imposto sobre o rendimento do periodo','Income tax for the period','pl',NULL,NULL,false,false,false,false,true)
,('A00026','Resultado líquido do período','Net result for the period','pl',NULL,NULL,true,false,false,false,true)
,('A00027','Resultado das atividades descontínuadas (líquido de impostos) incluíndo no resultado líquido do período','Net result-discontinued activities','pl',NULL,NULL,true,false,false,false,true)
,('A00101','Ativos fixos tangíveis','Tangible fixed assets','bs','nc','a',false,NULL,NULL,NULL,NULL)
,('A00102','Propriedades de investimento','Investment properties','bs','nc','a',false,NULL,NULL,NULL,NULL)
,('A00103','Goodwill','Goodwill','bs','nc','a',false,NULL,NULL,NULL,NULL)
;
INSERT INTO public.account (ies_id,name_pt,name_en,financial_statement,current_noncurrent,asset_liability_equity,sum_value,ebitda,ebit,ebt,net_results) VALUES 
('A00104','Ativos intangíveis','Intangible assets','bs','nc','a',false,NULL,NULL,NULL,NULL)
,('A00105','Ativos biológicos','Biological assets','bs','nc','a',false,NULL,NULL,NULL,NULL)
,('A00106','Participações financeiras - método da equivalência patrimonial','Investments in shareholdings-equity method','bs','nc','a',false,NULL,NULL,NULL,NULL)
,('A00107','Outros investimentos financeiros','Investments in shareholdings-other methods','bs','nc','a',false,NULL,NULL,NULL,NULL)
,('A00108','Créditos a receber','Non current shareholders','bs','nc','a',false,NULL,NULL,NULL,NULL)
,('A00109','Ativos por impostos diferidos','Deferred tax assets','bs','nc','a',false,NULL,NULL,NULL,NULL)
,('A00110','Investimento financeiros','Financial investments','bs','nc','a',false,NULL,NULL,NULL,NULL)
,('A00111','Créditos e outros ativos não correntes','Other financial assets','bs','nc','a',false,NULL,NULL,NULL,NULL)
,('A00112','Soma ativo não corrente','Total non current assets','bs','nc','a',true,NULL,NULL,NULL,NULL)
,('A00113','Inventários','Inventories','bs','c','a',false,NULL,NULL,NULL,NULL)
;
INSERT INTO public.account (ies_id,name_pt,name_en,financial_statement,current_noncurrent,asset_liability_equity,sum_value,ebitda,ebit,ebt,net_results) VALUES 
('A00114','Ativos biológicos','Bioligical assets','bs','c','a',false,NULL,NULL,NULL,NULL)
,('A00115','Clientes','Clients','bs','c','a',false,NULL,NULL,NULL,NULL)
,('A00116','Estado e outros entes públicos','State and other public bodies','bs','c','a',false,NULL,NULL,NULL,NULL)
,('A00117','Capital subscrito e não realizado','Current shareholders','bs','c','a',false,NULL,NULL,NULL,NULL)
,('A00118','Outros créditos a receber','Other receivables','bs','c','a',false,NULL,NULL,NULL,NULL)
,('A00119','Diferimentos','Deferreds','bs','c','a',false,NULL,NULL,NULL,NULL)
,('A00120','Ativos financeiros detidos para negociação','Available-for-sale financial assets','bs','c','a',false,NULL,NULL,NULL,NULL)
,('A00121','Outros ativos financeiros','Other current financial assets','bs','c','a',false,NULL,NULL,NULL,NULL)
,('A00122','Ativos não correntes detidos para venda','Non current assets held-for-sale','bs','c','a',false,NULL,NULL,NULL,NULL)
,('A00123','Outros ativos correntes ','Other current assets','bs','c','a',false,NULL,NULL,NULL,NULL)
;
INSERT INTO public.account (ies_id,name_pt,name_en,financial_statement,current_noncurrent,asset_liability_equity,sum_value,ebitda,ebit,ebt,net_results) VALUES 
('A00124','Caixa e depósitos bancários','Cash and cash equivalents','bs','c','a',false,NULL,NULL,NULL,NULL)
,('A00125','Soma ativo corrente','Total current assets','bs','c','a',true,NULL,NULL,NULL,NULL)
,('A00126','Total do ativo','Total assets','bs',NULL,'a',true,NULL,NULL,NULL,NULL)
,('A00127','Capital subscrito','Share capital','bs',NULL,'e',false,NULL,NULL,NULL,NULL)
,('A00128','Ações (quotas) próprias','Treasury shares','bs',NULL,'e',false,NULL,NULL,NULL,NULL)
,('A00129','Outros instrumentos de capital próprio','Other equity instruments','bs',NULL,'e',false,NULL,NULL,NULL,NULL)
,('A00130','Prémios de emissão','Share premium','bs',NULL,'e',false,NULL,NULL,NULL,NULL)
,('A00131','Reservas legais','Legal reserves','bs',NULL,'e',false,NULL,NULL,NULL,NULL)
,('A00132','Outras reservas','Other reserves','bs',NULL,'e',false,NULL,NULL,NULL,NULL)
,('A00133','Resultados transitados','Retained earnings','bs',NULL,'e',false,NULL,NULL,NULL,NULL)
;
INSERT INTO public.account (ies_id,name_pt,name_en,financial_statement,current_noncurrent,asset_liability_equity,sum_value,ebitda,ebit,ebt,net_results) VALUES 
('A00134','Excedentes de revalorização','Revaluation surplus','bs',NULL,'e',false,NULL,NULL,NULL,NULL)
,('A00135','Ajustamentos / outras variações no capitál próprio','Other equity changes','bs',NULL,'e',false,NULL,NULL,NULL,NULL)
,('A00136','Soma capital','Sum Capital','bs',NULL,'e',true,NULL,NULL,NULL,NULL)
,('A00137','Resultado líquido do período','Net result for the period','bs',NULL,'e',false,NULL,NULL,NULL,NULL)
,('A00138','Dividendos antecipados','Antecipated dividends','bs',NULL,'e',false,NULL,NULL,NULL,NULL)
,('A00139','Total do capital próprio','Total equity','bs',NULL,'e',true,NULL,NULL,NULL,NULL)
,('A00140','Provisões','Provisions','bs','nc','p',false,NULL,NULL,NULL,NULL)
,('A00141','Financiamentos obtidos','Non current financing obtained','bs','nc','p',false,NULL,NULL,NULL,NULL)
,('A00142','Responsabilidades por beneficios pós-emprego','Responsabilities for benefits after employment','bs','nc','p',false,NULL,NULL,NULL,NULL)
,('A00143','Passivos por impostos diferidos','Deferred tax liabilities','bs','nc','p',false,NULL,NULL,NULL,NULL)
;
INSERT INTO public.account (ies_id,name_pt,name_en,financial_statement,current_noncurrent,asset_liability_equity,sum_value,ebitda,ebit,ebt,net_results) VALUES 
('A00144','Outras dividas a pagar','Other non current payable accounts','bs','nc','p',false,NULL,NULL,NULL,NULL)
,('A00145','Soma passivo não corrente','Total non current liabilities','bs','nc','p',true,NULL,NULL,NULL,NULL)
,('A00146','Fornecedores','Suppliers','bs','c','p',false,NULL,NULL,NULL,NULL)
,('A00147','Adiantamento de clientes','Advances from clients','bs','c','p',false,NULL,NULL,NULL,NULL)
,('A00148','Estado e outros entes públcios','State and other public bodies','bs','c','p',false,NULL,NULL,NULL,NULL)
,('A00149','Financiamentos obtidos','Current financing obtained','bs','c','p',false,NULL,NULL,NULL,NULL)
,('A00150','Outras dívidas a pagar','Other current payable accounts','bs','c','p',false,NULL,NULL,NULL,NULL)
,('A00151','Diferimentos','Deferreds','bs','c','p',false,NULL,NULL,NULL,NULL)
,('A00152','Passivos financeiros detidos para negociação','Available-for-sale financial liabilities','bs','c','p',false,NULL,NULL,NULL,NULL)
,('A00153','Outros passivos financeiros','Other financial liabilities','bs','c','p',false,NULL,NULL,NULL,NULL)
;
INSERT INTO public.account (ies_id,name_pt,name_en,financial_statement,current_noncurrent,asset_liability_equity,sum_value,ebitda,ebit,ebt,net_results) VALUES 
('A00154','Passivos não correntes detidos para venda','Non current liabilities held-for-sale','bs','c','p',false,NULL,NULL,NULL,NULL)
,('A00155','Outros passivos correntes','Other current liabilities','bs','c','p',false,NULL,NULL,NULL,NULL)
,('A00156','Soma passivos correntes','Total current liabilities','bs','c','p',true,NULL,NULL,NULL,NULL)
,('A00157','Total do passivo','Total liabilities','bs',NULL,'p',true,NULL,NULL,NULL,NULL)
,('A00158','Total do capital próprio e do passivo','Total equity and liabilities','bs',NULL,'p',true,NULL,NULL,NULL,NULL)
,('A90001','Adiantamento de fornecedores',NULL,'bs','c','a',false,NULL,NULL,NULL,NULL)
,('A90002','Dividas sócios',NULL,'bs','c','p',false,NULL,NULL,NULL,NULL)
;