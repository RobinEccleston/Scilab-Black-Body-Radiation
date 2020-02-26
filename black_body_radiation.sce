
s = 0 //%spectral emittance
h = 6.62607004e-34 //%planks constant
k = 1.38064852e-23 //%boltzmanns constant
wl = 600e-9 //%wavelength (nm)
t = 293 //%absolute temperature (kelvin)
c = 3e8 //%speed of light (m/s)
e = exp(1)
pi=%pi

temps=300:5:400
//temps=[79 195 300 800 3000 6000]
temps=temps($:-1:1)
//temps=293
num_temps=size(temps,2)
cmap=jetcolormap(num_temps)
cmap=cmap($:-1:1,:)

wl_range=[300:10:25000]
wl_range=wl_range*1e-9
    
num_wls=size(wl_range,2)

f=scf(1)
clf(1)

f.color_map=cmap;

for j=1:num_temps
    
    t=temps(j)

    //disp(t)


    
    emittance=wl_range
    for i=1:num_wls
        wl=wl_range(i)
        s = ( (2*pi*h*c^2) / (wl^5) ) * 1 / (e^((c*h)/(wl*k*t)) -1 )
        emittance(i)=s;
    end
    
    plot2d('nn', wl_range*1e9, emittance, j)
    //disp(emittance)

end

xlabel('Wavelength (nm)')
ylabel('Spectral Emittance')

legend(string(temps))
