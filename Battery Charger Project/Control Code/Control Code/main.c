EALLOW;
#define ADCINB ((volatile uint32_t*) 0x00007480)
#define ADCINC ((volatile uint32_t*) 0x00007500)

#define ADCSOC0CTL(module) (volatile uint32_t*)((uint32_t) (module) + (0x10))
#define IN5 ((uint32_t) 0x05)

void ADC_init()
*(volatile uint32_t*) ADCSOC0CTL(ADCINB) &= ~(15<<16);
*(volatile uint32_t*) ADCSOC0CTL(ADCINB) |= (15<<IN5);

int main(void)
{
	
	return 0;
}
