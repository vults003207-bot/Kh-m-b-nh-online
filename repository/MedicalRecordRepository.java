package com.hospital.repository;

import com.hospital.entity.MedicalRecord;
import com.hospital.entity.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.Optional;

public interface MedicalRecordRepository
        extends JpaRepository<MedicalRecord, Long>,
        JpaSpecificationExecutor<MedicalRecord> {

    Optional<MedicalRecord> findByAppointment(Appointment appointment);

    boolean existsByAppointment(Appointment appointment);
}