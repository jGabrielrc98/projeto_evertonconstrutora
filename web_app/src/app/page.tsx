import Navbar from '@/components/layout/Navbar';
import HeroSection from '@/components/sections/HeroSection';
import AboutSection from '@/components/sections/AboutSection';
import ServicesSection from '@/components/sections/ServicesSection';
import CustomersSection from '@/components/sections/CustomersSection';
import LocationSection from '@/components/sections/LocationSection';
import ContactSection from '@/components/sections/ContactSection';
import FloatingActionButtons from '@/components/ui/FloatingActionButtons';

export default function Home() {
  return (
    <main>
      <Navbar />
      <HeroSection />
      <AboutSection />
      <ServicesSection />
      <CustomersSection />
      <LocationSection />
      <ContactSection />
      <FloatingActionButtons />
    </main>
  );
}
