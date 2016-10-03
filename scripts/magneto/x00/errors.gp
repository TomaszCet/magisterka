reset
set term wxt

data_1up = '../../../dane/magneto/x00/wzdluzna_up.dat'
data_2up = '../../../dane/magneto/x00/poprzeczna_up.dat'
data_1down = '../../../dane/magneto/x00/wzdluzna_down.dat'
data_2down = '../../../dane/magneto/x00/poprzeczna_down.dat'

a_up            = 793.18
k_up            = -1.40331
n_up            = 2.0587
a_up1            = 793.18+6.186
k_up1            = -1.40331+0.01844
n_up1            = 2.0587+0.03379
a_up2            = 793.18-6.186
k_up2            = -1.40331-0.01844
n_up2            = 2.0587-0.03379
a_down          = 784.686
k_down          = -1.19033
n_down          = 1.91665
a_down1          = 784.686+7.583
k_down1          = -1.19033+0.01913
n_down1          = 1.91665+0.1604
a_down2          = 784.686-7.583
k_down2          = -1.19033-0.01913
n_down2          = 1.91665-0.1604

hill_up(x) = a_up*(x**n_up)/(k_up**n_up+x**n_up)
hill_up1(x) = a_up1*(x**n_up1)/(k_up1**n_up1+x**n_up1)
hill_up2(x) = a_up2*(x**n_up2)/(k_up2**n_up2+x**n_up2)
hill_down(x) = a_down*(x**n_down)/(k_down**n_down+x**n_down)
hill_down1(x) = a_down1*(x**n_down1)/(k_down1**n_down1+x**n_down1)
hill_down2(x) = a_down2*(x**n_down2)/(k_down2**n_down2+x**n_down2)
hill1_up(x)= A_up+(B_up-A_up)*(x**N_up)/(K_up**N_up+x**N_up)
hill1_down(x)=A_down+(B_down-A_down)*(x**N_down)/(K_down**N_down+x**N_down)

plot hill_down(-x) ls 2, hill_down1(-x) ls 2, hill_down2(-x) ls 2, hill_up(-x) ls 1, hill_up1(-x) ls 1, hill_up2(-x) ls 1,

