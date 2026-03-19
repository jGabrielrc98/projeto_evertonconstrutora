'use client';

import React from 'react';
import styles from './HeroSection.module.css';
import { motion } from 'framer-motion';

export default function HeroSection() {
  return (
    <section id="inicio" className={styles.heroSection}>
      <video
        autoPlay
        muted
        loop
        playsInline
        className={styles.videoBackground}
      >
        <source src="/assets/videos/videoDeInicio.mp4" type="video/mp4" />
        Seu navegador não suporta a tag de vídeo.
      </video>
      <div className={styles.overlay}></div>
      <div className={`container ${styles.content}`}>
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8 }}
          className={styles.textContent}
        >
          <h1 className={styles.title}>
            Excelência e Segurança em <span className={styles.highlight}>Obras Civis</span>
          </h1>
          <p className={styles.subtitle}>
            A ES Construtora apresenta soluções técnicas modernas para manutenção e ampliações, com máxima qualidade e prazos rigorosos.
          </p>
          <div className={styles.actions}>
            <a href="#orcamento" className="btn-primary">
              Solicitar Orçamento
            </a>
            <a href="#sobre" className={styles.btnSecondary}>
              Conheça Nossa História
            </a>
          </div>
        </motion.div>
      </div>
    </section>
  );
}
