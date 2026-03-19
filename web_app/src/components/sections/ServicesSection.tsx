'use client';

import React from 'react';
import styles from './ServicesSection.module.css';
import { Ruler, Map, Shield, Settings, TrendingUp, Key, Wrench, Home, Hammer, Droplet } from 'lucide-react';
import useEmblaCarousel from 'embla-carousel-react';
import Autoplay from 'embla-carousel-autoplay';
import { motion } from 'framer-motion';

export default function ServicesSection() {
  const [emblaRef] = useEmblaCarousel({ loop: true }, [Autoplay({ delay: 3000 })]);

  const services = [
    { name: 'Fundação e Estrutural', icon: <Ruler /> },
    { name: 'Topografia', icon: <Map /> },
    { name: 'Infraestrutura', icon: <Settings /> },
    { name: 'Terraplanagem', icon: <TrendingUp /> },
    { name: 'Acabamentos', icon: <Home /> },
    { name: 'Demolição e Reforma', icon: <Hammer /> },
    { name: 'Steel Frame', icon: <Key /> },
    { name: 'Drywall', icon: <Shield /> },
  ];

  const imageUrls = [
    '/assets/images/imagem2.jpeg',
    '/assets/images/imagem4.jpeg',
    '/assets/images/imagem28.jpeg',
    '/assets/images/imagem34.jpeg',
  ];

  return (
    <section id="servicos" className={styles.servicesSection}>
      <div className={`container ${styles.container}`}>
        <h2 className="section-title">NOSSOS SERVIÇOS</h2>
        
        <div className={styles.grid}>
          {/* Services List */}
          <motion.div 
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className={styles.servicesList}
          >
            {services.map((service, index) => (
              <div key={index} className={styles.serviceItem}>
                <div className={styles.iconWrapper}>{service.icon}</div>
                <span className={styles.serviceName}>{service.name}</span>
              </div>
            ))}
          </motion.div>

          {/* Carousel */}
          <motion.div 
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className={styles.carouselContainer}
          >
            <div className={styles.embla} ref={emblaRef}>
              <div className={styles.emblaContainer}>
                {imageUrls.map((url, index) => (
                  <div className={styles.emblaSlide} key={index}>
                    <img src={url} alt={`Serviço ${index + 1}`} className={styles.slideImage} />
                  </div>
                ))}
              </div>
            </div>
          </motion.div>
        </div>
      </div>
    </section>
  );
}
