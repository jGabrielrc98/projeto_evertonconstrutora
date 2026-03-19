'use client';
import React, { useEffect, useState, useRef } from 'react';
import styles from './CustomersSection.module.css';
import { motion, useInView } from 'framer-motion';
import CarouselClientes from '../ui/CarouselClientes';

const AnimatedNumber = ({ end, suffix = '' }: { end: number, suffix?: string }) => {
  const [count, setCount] = useState(0);
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true });

  useEffect(() => {
    if (isInView) {
      let start = 0;
      const duration = 2000;
      const increment = end / (duration / 16);
      const timer = setInterval(() => {
        start += increment;
        if (start > end) {
          setCount(end);
          clearInterval(timer);
        } else {
          setCount(Math.ceil(start));
        }
      }, 16);
      return () => clearInterval(timer);
    }
  }, [end, isInView]);

  return <span ref={ref}>{count.toLocaleString('pt-BR')}{suffix}</span>;
};

export default function CustomersSection() {
  const stats = [
    { label: 'Anos de experiência', value: 7 },
    { label: 'KM de pisos assentados', value: 5 },
    { label: 'KM de concreto feito', value: 15 },
    { label: 'M² construído', value: 30000 },
    { label: 'KM de paredes pintadas', value: 10 },
  ];

  return (
    <section id="clientes" className={styles.customersSection}>
      <div className={`container ${styles.container}`}>
        <h2 className="section-title">CLIENTES</h2>

        <CarouselClientes />

        <div className={styles.statsContainer}>
          <h3 className={styles.statsTitle}>NOSSA HISTÓRIA FALA POR NÓS<br />NOSSOS NÚMEROS TAMBÉM</h3>
          <div className={styles.statsGrid}>
            {stats.map((stat, i) => (
              <motion.div
                key={i}
                className={styles.statCard}
                initial={{ opacity: 0, scale: 0.8 }}
                whileInView={{ opacity: 1, scale: 1 }}
                viewport={{ once: true }}
                transition={{ delay: i * 0.1 }}
              >
                <div className={styles.statValue}>
                  <AnimatedNumber end={stat.value} />
                </div>
                <div className={styles.statLabel}>{stat.label}</div>
              </motion.div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
