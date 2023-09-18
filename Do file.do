

keep wdi_popden wef_ci wdi_birth wdi_migration



ssc install asdoc
asdoc sum wdi_popden wef_ci wdi_birth wdi_migration



twoway (scatter wdi_popden wef_ci) (lfit wdi_popden wef_ci)

twoway (scatter wdi_popden wdi_birth) (lfit wdi_popden wdi_birth)

twoway (scatter wdi_popden wdi_migration) (lfit wdi_popden wdi_migration)



ssc install outreg2
reg wdi_popden wef_ci
outreg2 using regression.doc, replace title(Regression results) ctitle (Model 1)

reg wdi_popden wef_ci wdi_birth wdi_migration
outreg2 using regression.doc , append ctitle(Model 2)



reg wdi_popden wef_ci

reg wdi_popden wef_ci wdi_birth wdi_migration


gen lan_y= ln(wdi_popden)
gen lan_x=ln(wef_ci)

twoway (scatter lan_y lan_x) (lfit lan_y lan_x)

twoway (scatter lan_y wdi_birth) (lfit lan_y wdi_birth)

twoway (scatter lan_y wdi_migration) (lfit lan_y wdi_migration)



ssc install outreg2
reg lan_y lan_x
outreg2 using regression.doc, replace title(Regression results) ctitle (Model 1)

reg lan_y lan_x wdi_birth wdi_migration
outreg2 using regression.doc , append ctitle(Model 2)



reg lan_y lan_x

reg lan_y lan_x wdi_birth wdi_migration



