import React from 'react';
import styles from './LocationSection.module.css';
import { MapPin } from 'lucide-react';

export default function LocationSection() {
  return (
    <section id="localizacao" className={styles.locationSection}>
      <div className={`container ${styles.container}`}>
        <h2 className={`section-title ${styles.title}`}>LOCALIZAÇÃO</h2>
        <div className={styles.mapContainer}>
          <iframe 
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3896.2238327954153!2d-38.43372468461872!3d-12.127833991410757!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x716be2f16e838b9%3A0x6bba46c5a085731f!2sR.%20Manoel%20Vasconcelos%2C%20116%20-%20Alagoinhas%20Velha%2C%20Alagoinhas%20-%20BA%2C%2048000-000!5e0!3m2!1spt-BR!2sbr!4v1690000000000!5m2!1spt-BR!2sbr" 
            width="100%" 
            height="450" 
            style={{ border: 0 }} 
            allowFullScreen={false} 
            loading="lazy" 
            referrerPolicy="no-referrer-when-downgrade"
            className={styles.iframe}
          ></iframe>
        </div>
        <div className={styles.addressBox}>
          <MapPin size={32} color="var(--color-accent)" />
          <div>
            <p><strong>Escritório Central</strong></p>
            <p>Travessa Manuel Vasconcelos, N° 116</p>
            <p>Santo Antonio, Alagoinhas-BA</p>
          </div>
        </div>
      </div>
    </section>
  );
}
